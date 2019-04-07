//
//  Log.swift
//  Watsons
//
//  Created by daniele salvioni on 20/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation

class Log
{
    public enum Level: Int
    {
        case off
        case error
        case debug
    }
    
    #if DEBUG
    public static var level: Level = .debug
    #else
    public static var level: Level = .error
    #endif
    
    public class func error(_ items: Any, separator: String = " ", terminator: String = "\n")
    {
        if self.level.rawValue <= Level.error.rawValue
        {
            print(items, separator: separator, terminator: terminator)
        }
    }
    
    public class func debug(_ items: Any, separator: String = " ", terminator: String = "\n")
    {
        if self.level.rawValue <= Level.debug.rawValue
        {
            print(items, separator: separator, terminator: terminator)
        }
    }
}
