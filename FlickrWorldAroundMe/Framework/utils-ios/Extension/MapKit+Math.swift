//
//  MapKit+Math.swift
//  Watsons
//
//  Created by Daniele Salvioni on 28/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import MapKit

extension CLLocationCoordinate2D
{
    func distance(from location: CLLocationCoordinate2D) -> CLLocationDistance
    {
        let location1 = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let location2 = CLLocation(latitude:location.latitude, longitude: location.longitude)
        
        return location1.distance(from: location2)
    }
}

extension MKMapRect
{
    var center: CLLocationCoordinate2D
    {
        get
        {
            let mapPoint = MKMapPoint.init(x: self.midX, y: self.midY)
            return mapPoint.coordinate
        }
    }
}
