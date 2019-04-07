//
//  NSObject+ClassName.swift
//  Watsons
//
//  Created by Daniele Salvioni on 16/03/19.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol
{
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol
{
    public static var className: String
    {
        return String(describing: self)
    }
    
    public var className: String
    {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
