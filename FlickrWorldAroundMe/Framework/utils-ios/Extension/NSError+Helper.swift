//
//  NSError+Helper.swift
//  Watsons
//
//  Created by Daniele Salvioni on 04/03/19.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation

extension NSError
{
    public class func create(title: String = NSLocalizedString("Error", comment: "Error"), message: String) -> NSError
    {
        return NSError(domain:title, code:0, userInfo:[NSLocalizedDescriptionKey: message])
    }
}
