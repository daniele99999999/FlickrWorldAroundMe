//
//  FlickrPaginatedPhotos.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 07/04/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation

class FlickrPaginatedPhotos: Codable
{
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [FlickrPhoto]?
}
