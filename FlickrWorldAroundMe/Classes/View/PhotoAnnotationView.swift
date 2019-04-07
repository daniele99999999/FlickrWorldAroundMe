//
//  PhotoAnnotationView.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 07/04/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit
import MapKit

class PhotoAnnotationView: MKAnnotationView
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

private extension PhotoAnnotationView
{
    func configure(with annotation: MKAnnotation)
    {
        guard let _annotation = annotation as? FlickrPhoto else { fatalError("Unexpected annotation type: \(annotation)") }
        
        tintColor = Constants.Color.black1
        self.image = UIImage(named: Constants.Image.marker)
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
