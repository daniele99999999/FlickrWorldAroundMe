//
//  FlickrNetworkService.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

protocol FlickrNetworkServiceProtocol: class
{
    func retrievePhotosAroundLocation(activityIndicator: ActivityIndicatorProtocol?,
                                      latitude: CGFloat,
                                      longitude: CGFloat,
                                      radius: CGFloat,
                                      successBlock: @escaping (FlickrPhotosAroundLocationResponse) -> Void,
                                      errorBlock: @escaping (Error, Bool) -> Void)
}

class FlickrNetworkService : AbstractNetworkService, FlickrNetworkServiceProtocol
{
    
    // MARK: - Initializers
    init()
    {
        super.init(baseAddress: Constants.Flickr.Configuration.baseUrl)
    }
    
    
    // MARK: - request parameters
    private var baseParameters: [String:String]
    {
        get
        {
            return [
                Constants.Flickr.BaseParameters.Key.apiKey : Constants.Flickr.BaseParameters.Value.apiKey,
                Constants.Flickr.BaseParameters.Key.format : Constants.Flickr.BaseParameters.Value.format,
                Constants.Flickr.BaseParameters.Key.noJsonCallback : Constants.Flickr.BaseParameters.Value.noJsonCallback,
                Constants.Flickr.BaseParameters.Key.elementsPerPage : Constants.Flickr.BaseParameters.Value.elementsPerPage
            ]
        }
    }
    
    private func photosAroundLocationDictionary(latitude: CGFloat,
                                                longitude: CGFloat,
                                                radius: CGFloat) -> [String:String]
    {
        return [
            Constants.Flickr.BaseParameters.Key.path : Constants.Flickr.ApiPhotoSearchGeo.pathValue,
            Constants.Flickr.ApiPhotoSearchGeo.extrasKey : Constants.Flickr.ApiPhotoSearchGeo.extrasValue,
            Constants.Flickr.ApiPhotoSearchGeo.latKey : latitude.string,
            Constants.Flickr.ApiPhotoSearchGeo.lonKey : longitude.string,
            Constants.Flickr.ApiPhotoSearchGeo.radiusKey : radius.string
        ]
    }
    
    func retrievePhotosAroundLocation(activityIndicator: ActivityIndicatorProtocol? = nil,
                                      latitude: CGFloat,
                                      longitude: CGFloat,
                                      radius: CGFloat,
                                      successBlock: @escaping (FlickrPhotosAroundLocationResponse) -> Void,
                                      errorBlock: @escaping (Error, Bool) -> Void)
    {
        self.performRestOperation(.GET,
                                  pathUrl: Constants.Flickr.Configuration.baseApiPath,
                                  parameters: baseParameters + self.photosAroundLocationDictionary(latitude: latitude, longitude: longitude, radius: radius),
                                  savedAuthType: NetworkServiceAuthType.None,
                                  activityIndicator: activityIndicator,
                                  successBlock: successBlock,
                                  errorBlock: errorBlock)
    }
}
