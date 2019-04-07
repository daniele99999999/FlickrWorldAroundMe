//
//  ViewController.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    var photos = [FlickrPhoto]()
    
    var service: FlickrNetworkServiceProtocol?
    var activity: ActivityIndicatorProtocol?
    var locationManager: LocationManager!
    
    class func createOne(service: FlickrNetworkServiceProtocol?, locationManager: LocationManager, activity: ActivityIndicatorProtocol?) -> UIViewController
    {
        let vc: ViewController = self.loadFromStoryboard(storyboardName: Constants.Resources.Storyboards.Main.rawValue)
        vc.service = service
        vc.locationManager = locationManager
        vc.activity = activity
        return vc
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.title = "Photos Around Me"
        
        self.setupMap()
        NotificationCenter.default.addObserver(self, selector: #selector(self.locationFound(_:)), name: NSNotification.Name(rawValue: LocationManager.kNotificationLocationAccurateLocationFinished), object: nil)
        self.locationManager?.locationManagerEnabled = true
        self.locationManager?.locationAskPermissionsAndStart(type: .authorizedWhenInUse)
        
        self.activity?.showActivityIndicator(nil)
    }
    
    fileprivate func updatePhotosByUserLocation(_ location: CLLocationCoordinate2D,
                                                zoom: Bool = true,
                                                completion: @escaping () -> Void)
    {
        service?.retrievePhotosAroundLocation(activityIndicator: self.activity,
                                              latitude: location.latitude.cgFloat,
                                              longitude: location.longitude.cgFloat,
                                              radius: 1,
                                              successBlock:
        { [weak self] (response: FlickrPhotosAroundLocationResponse) in
            self?.updateElements(photos: response.photos?.photo ?? [])
            if zoom { self?.mapView.setVisibleMapRectToFitAllAnnotations(animated: true) }
            completion()
        },
                                              errorBlock:
        { [weak self] (error: Error, validResponse: Bool) in
            self?.showGenericError(error)
            self?.updateElements(photos: [])
            completion()
        })
    }
    
    fileprivate func setupMap()
    {
        if #available(iOS 11.0, *)
        {
            self.mapView.register(PhotoMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            self.mapView.register(PhotoClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        }
        
        self.mapView.showsUserLocation = false
        self.mapView.delegate = self
    }
    
    fileprivate func updateElements(photos: [FlickrPhoto])
    {
        Log.debug("photos count: \(photos.count)")
        
        self.photos = photos
        self.updateAnnotations()
    }
    
    fileprivate func removeAnnotations()
    {
        self.mapView.removeAnnotations(self.photos)
    }
    
    fileprivate func updateAnnotations()
    {
        self.removeAnnotations()
        self.mapView.addAnnotations(self.photos)
    }
    
    @objc func locationFound(_ notification: Notification)
    {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: LocationManager.kNotificationLocationAccurateLocationFinished), object: nil)
    
        self.updatePhotosByUserLocation(self.locationManager.locationUserCoordinate,
                                        zoom: true)
        { [weak self] in
            self?.activity?.hideActivityIndicator()
        }
    }
}

extension ViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        guard !(annotation is MKUserLocation) else { return nil }
        
        if #available(iOS 11.0, *)
        {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: PhotoAnnotationView.className) as? PhotoAnnotationView
        if let _annotationView = annotationView
        {
            _annotationView.annotation = annotation
        }
        else
        {
            let view = PhotoAnnotationView(annotation: annotation, reuseIdentifier: PhotoAnnotationView.className)
            view.annotation = annotation
            annotationView = view
        }
        
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        guard let annotation = view.annotation else { return }
        
        if #available(iOS 11.0, *)
        {
            if let clusterAnnotation = annotation as? MKClusterAnnotation
            {
                mapView.deselectAnnotation(annotation, animated: false)
                mapView.setVisibleMapRectToFitAnnotations(annotations: clusterAnnotation.memberAnnotations)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    {
        Log.debug("userLocation: \(userLocation)")
        
        if self.photos.isEmpty
        {
            self.mapView.setCenter(userLocation.coordinate, animated: true)
        }
    }
}

