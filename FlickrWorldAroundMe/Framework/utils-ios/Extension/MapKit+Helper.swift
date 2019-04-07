//
//  MapView+Helper.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 07/04/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import MapKit

extension MKMapView
{
    func setVisibleMapRectToFitAllAnnotations(animated: Bool = true,
                                              edgePadding: UIEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35))
    {
        self.setVisibleMapRectToFitAnnotations(animated: animated, annotations: self.annotations, edgePadding: edgePadding)
    }
    
    func setVisibleMapRectToFitAnnotations(animated: Bool = true,
                                           annotations: [MKAnnotation],
                                           edgePadding: UIEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35))
    {
        self.layoutMargins = edgePadding
        self.showAnnotations(annotations, animated: animated)
    }
}
