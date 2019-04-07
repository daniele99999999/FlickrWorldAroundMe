//
//  CustomStringConvertibleExtension.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation

extension CustomStringConvertible
{
    public var description : String
    {
        var description = "***** \(type(of: self)) *****\n"
        
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children
        {
            if let propertyName = child.label
            {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        
        description += "***** \(type(of: self)) *****\n"
        
        return description
    }
}
