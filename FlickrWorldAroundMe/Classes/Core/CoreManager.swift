//
//  CoreManager.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class CoreManager
{
    static let shared = CoreManager()
    
    let service: FlickrNetworkServiceProtocol
    let locationManager: LocationManager
    let activityIndicator: ActivityIndicatorProtocol
    
    private init()
    {
        self.service = FlickrNetworkService()
        self.locationManager = LocationManager()
        self.activityIndicator = ActivityIndicator()
    }
}
