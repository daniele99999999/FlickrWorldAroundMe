//
//  Constants.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift

public enum Constants
{
    public enum Color
    {
        public static let black1 = UIColor.black
        public static let white1 = UIColor.white
        public static let white2 = UIColor.white.withAlphaComponent(0.6)
        public static let white3 = UIColor.white.withAlphaComponent(0.2)
        public static let green1 = UIColor.green
    }
    
    public enum Image
    {
        public static let placeholder = "placeholder.default.image"
        public static let marker = "marker.default.image"
    }
    
    public enum Localize
    {
        public enum Alert
        {
            public static let infoTitle = "info.title".localized()
            public static let infoButton = "info.button".localized()
            public static let infoCancel = "info.cancel".localized()
            
            public static let attentionTitle = "attention.title".localized()
            public static let attentionButton = "attention.button".localized()
            public static let attentionCancel = "attention.cancel".localized()
            
            public static let errorTitle = "error.title".localized()
            public static let errorButton = "error.button".localized()
            public static let errorCancel = "error.cancel".localized()
        }
        
        public enum Activity
        {
            public static let loadingTitleMessage = "activity.loading.title.message".localized()
            public static let successTitleMessage = "activity.success.title.message".localized()
            public static let failureTitleMessage = "activity.failure.title.message".localized()
        }
        
        public enum Map
        {
//            public static let HeaderTitle = "home.header.title".localized()
        }
    }
    
    public enum Resources
    {
        public enum Storyboards: String
        {
            case Main
        }
        
    }
    
    public enum Flickr
    {
        public enum Configuration
        {
            public static let baseUrl = "https://api.flickr.com"
            public static let baseApiPath = "/services/rest/"
        }
        
        public enum BaseParameters
        {
            public enum Key
            {
                public static let apiKey = "api_key"
                public static let format = "format"
                public static let noJsonCallback = "nojsoncallback"
                public static let elementsPerPage = "per_page"
                public static let path = "method"
            }
            
            public enum Value
            {
                public static let apiKey = "6fb3207b5dc9ca5c5c483b062dacefe8"
                public static let format = "json"
                public static let elementsPerPage = 30.string
                public static let noJsonCallback = true.string
            }
        }
        
        public enum ApiPhotoSearchGeo
        {
            public static let pathValue = "flickr.photos.search"
            public static let extrasKey = "extras"
            public static let extrasValue = "geo,url_t"
            public static let latKey = "lat"
            public static let lonKey = "lon"
            public static let radiusKey = "radius"
        }
    }
}
