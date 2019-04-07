//
//  FlickrPhoto.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 07/04/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import MapKit
import SwifterSwift

class FlickrPhoto: NSObject, Codable
{
    let id: String
    let url: String
    let latitude: Double?
    let longitude: Double?
    let height: Float?
    let width: Float?
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case url = "url_t"
        case latitude = "latitude"
        case longitude = "longitude"
        case height = "height_t"
        case width = "width_t"
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.url = try container.decode(String.self, forKey: .url)
        self.latitude = try container.decode(String.self, forKey: .latitude).double()
        self.longitude = try container.decode(String.self, forKey: .longitude).double()
        self.height = try container.decode(String.self, forKey: .height).float()
        self.width = try container.decode(String.self, forKey: .width).float()
    }
}

extension FlickrPhoto : MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    {
        return CLLocationCoordinate2DMake(self.latitude ?? 0, self.longitude ?? 0)
    }
    
    var title: String?
    {
        return self.id
    }
    
    var subtitle: String?
    {
        guard let _latitude = self.latitude, let _longitude = self.longitude else { return nil }
        
        return "\(_latitude.string), \(_longitude.string)"
    }
}
