//
//  LocationManager.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 07/04/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate
{
    internal static let kNotificationLocationAccurateLocationFinished   = "kNotificationLocationAccurateLocationFinished"
    
    var locationManager: CLLocationManager?
    var locationUser: CLLocation? = nil
    
    var locationUpdatesStopAfterAccurateLocationFound = true
    
    var locationUserFallbackCoordinate: CLLocationCoordinate2D
    {// Rome
         return CLLocationCoordinate2DMake(41.9100497, 12.4657871)
    }
    
    var locationUserCoordinate: CLLocationCoordinate2D
    {
        guard let _locationUserCoordinate = self.locationUser?.coordinate else { return self.locationUserFallbackCoordinate }
        return _locationUserCoordinate
    }
    
    var locationUserCoordinateAreValid: Bool
    {
        return CLLocationCoordinate2DIsValid(self.locationUserCoordinate)
    }
    
    var locationManagerEnabled: Bool
    {
        get
        {
            return self.locationManager != nil
        }
        set
        {
            if newValue
            {
                self.locationSetupConfiguration()
            }
            else
            {
                self.locationManager?.stopUpdatingLocation()
                self.locationManager = nil
            }
        }
    }
    
    fileprivate func locationSetupConfiguration()
    {
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = CLLocationManager()
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager?.delegate = self
    }
    
    func locationAskPermissionsAndStart(type: CLAuthorizationStatus)
    {
        if [CLAuthorizationStatus.authorizedAlways, CLAuthorizationStatus.authorizedWhenInUse].contains(type)
        {
            switch CLLocationManager.authorizationStatus()
            {
            case .notDetermined: // richiesto autorizzazione
                switch type
                {
                case .authorizedAlways:
                    self.locationManager?.requestAlwaysAuthorization()
                case .authorizedWhenInUse:
                    self.locationManager?.requestWhenInUseAuthorization()
                default:
                    break
                }
            case .denied, .restricted:
                self.locationShowAlertPermissionDeniedHint()
            case .authorizedWhenInUse, .authorizedAlways:
                if self.locationUpdatesStopAfterAccurateLocationFound
                {
                    self.locationManager?.requestLocation()
                }
                else
                {
                    self.locationManager?.startUpdatingLocation()
                }
            }
        }
    }
    
    func locationShowAlertPermissionDeniedRequired(okButtonBlock: (() -> Void)? = nil)
    {
        let title = NSLocalizedString("Authorization Required", comment: "")
        let message = NSLocalizedString("The app needs to be granted the permission to access your location.\n\n Grant the permission by going to Settings", comment: "") + " > \(AppInfoUtils.getAppBundleName())"
        self.locationShowAlertPermissionDenied(title: title, message: message, okButtonBlock: okButtonBlock)
    }
    
    func locationShowAlertPermissionDeniedHint(okButtonBlock: (() -> Void)? = nil)
    {
        let title = NSLocalizedString("Hint", comment: "")
        let message = NSLocalizedString("In order to maximize the experience, the app needs to be granted the permission to access your location.\n\n Grant the permission by going to Settings", comment: "") + " > \(AppInfoUtils.getAppBundleName())"
        self.locationShowAlertPermissionDenied(title: title, message: message, okButtonBlock: okButtonBlock)
    }
    
    fileprivate func locationShowAlertPermissionDenied(title: String, message: String, okButtonBlock: (() -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Settings", comment: "Settings"), style: .default, handler:
            { action in
                if let url = URL(string: UIApplication.openSettingsURLString)
                {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default, handler:
            { action in
                okButtonBlock?()
        }))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        switch status
        {
        case .authorizedAlways, .authorizedWhenInUse:
            if CLLocationManager.locationServicesEnabled()
            {
                if self.locationUpdatesStopAfterAccurateLocationFound
                {
                    self.locationManager?.requestLocation()
                }
                else
                {
                    self.locationManager?.startUpdatingLocation()
                }
            }
        case .denied, .restricted:
            self.locationManagerEnabled = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LocationManager.kNotificationLocationAccurateLocationFinished), object: self, userInfo: nil)
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        if let clError = error as? CLError
        {
            switch clError
            {
            case CLError.locationUnknown:
                Log.debug("didFailWithError: location unknown")
            case CLError.denied:
                Log.debug("didFailWithError: denied")
                self.locationUser = CLLocation(latitude: kCLLocationCoordinate2DInvalid.latitude, longitude: kCLLocationCoordinate2DInvalid.longitude)
            default:
                Log.debug("didFailWithError: other Core Location error")
                self.locationUser = CLLocation(latitude: kCLLocationCoordinate2DInvalid.latitude, longitude: kCLLocationCoordinate2DInvalid.longitude)
            }
        }
        else
        {
            Log.debug("didFailWithError: \(error.localizedDescription)")
            self.locationUser = CLLocation(latitude: kCLLocationCoordinate2DInvalid.latitude, longitude: kCLLocationCoordinate2DInvalid.longitude)
        }
        
        if self.locationUpdatesStopAfterAccurateLocationFound
        {
            self.locationManagerEnabled = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LocationManager.kNotificationLocationAccurateLocationFinished), object: self, userInfo: nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        Log.debug("didUpdateLocations: \(String(describing: locations.first))")

        self.locationUser = locations.first
        
        if self.locationUpdatesStopAfterAccurateLocationFound
        {
            self.locationManagerEnabled = false
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LocationManager.kNotificationLocationAccurateLocationFinished), object: self, userInfo: nil)
        }
    }
}
