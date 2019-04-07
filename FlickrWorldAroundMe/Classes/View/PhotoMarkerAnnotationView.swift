//
//  StoreMarkerAnnotationView.swift
//  Watsons
//
//  Created by daniele salvioni on 25/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit
import MapKit

@available(iOS 11.0, *)
internal final class PhotoMarkerAnnotationView: MKMarkerAnnotationView
{
    private var imageView: UIImageView?
    
    //  MARK: Properties
    internal override var annotation: MKAnnotation? { didSet { annotation.flatMap(configure(with:)) } }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.imageView?.cancelPendingLoad()
        self.imageView?.image = UIImage(named: Constants.Image.placeholder)
    }
}

//  MARK: Configuration

@available(iOS 11.0, *)
private extension PhotoMarkerAnnotationView
{
    func configure(with annotation: MKAnnotation)
    {
        guard let _annotation = annotation as? FlickrPhoto else { fatalError("Unexpected annotation type: \(annotation)") }
        
        markerTintColor = Constants.Color.black1
        tintColor = Constants.Color.black1
        clusteringIdentifier = String(describing: PhotoMarkerAnnotationView.self)
        canShowCallout = true
        if self.imageView == nil
        {
            self.imageView = UIImageView()
            self.imageView?.backgroundColor = UIColor.clear
            self.imageView?.contentMode = .scaleAspectFit
            detailCalloutAccessoryView = self.imageView
        }
        self.imageView?.loadImage(urlString: _annotation.url, placeholder: UIImage(named: Constants.Image.placeholder), completion: nil)
    }
}
