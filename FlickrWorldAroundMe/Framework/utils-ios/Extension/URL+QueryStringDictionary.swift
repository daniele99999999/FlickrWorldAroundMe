//
//  UserDefaults+Utility.swift
//
//
//  Created by Daniele Salvioni on 12/12/2017.
//  Copyright © 2017 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

extension URL
{
    //--------------------------------------------------------------
    public var queryDictionary: [String: String]?
    {
        guard let query = URLComponents(string: self.absoluteString)?.query else { return nil}
        
        var queryStrings = [String: String]()
        for pair in query.components(separatedBy: "&")
        {
            let key = pair.components(separatedBy: "=")[0]
            
            let value = pair
                .components(separatedBy:"=")[1]
                .replacingOccurrences(of: "+", with: " ")
                .removingPercentEncoding ?? ""
            
            queryStrings[key] = value
        }
        return queryStrings
    }
}
