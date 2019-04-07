//
//  FlickrPhotosAroundLocationResponse.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class FlickrPhotosAroundLocationResponse: Codable
{
    let stat: String
    let photos: FlickrPaginatedPhotos?
}

