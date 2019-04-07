//
//  UserDefaults+Utility.swift
//
//
//  Created by Daniele Salvioni on 12/12/2017.
//  Copyright © 2017 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

extension UserDefaults
{
    //--------------------------------------------------------------
    static public func retrieveValue<T>(key: String, userDefaultsInstance: UserDefaults = UserDefaults.standard) -> T?
    {
        let result: Any? = userDefaultsInstance[key]
        return result as? T
    }
    
    //--------------------------------------------------------------
    static public func retrieveValue<T>(key: String, suiteName: String?) -> T?
    {
        guard let userDefaults = UserDefaults.init(suiteName: suiteName) else
        {
            return nil
        }
        
        return UserDefaults.retrieveValue(key: key, userDefaultsInstance: userDefaults)
    }
    
    //--------------------------------------------------------------
    static public func saveValue<T>(key: String, value: T?, userDefaultsInstance: UserDefaults = UserDefaults.standard) -> Bool
    {
        guard let value = value else
        {
            return false
        }
        
        userDefaultsInstance[key] = value
        userDefaultsInstance.synchronize()
        return true
    }
    
    //--------------------------------------------------------------
    static public func saveValue<T>(key: String, value: T?, suiteName: String?) -> Bool
    {
        guard let userDefaults = UserDefaults.init(suiteName: suiteName) else
        {
            return false
        }
        
        return UserDefaults.saveValue(key: key, value: value, userDefaultsInstance: userDefaults)
    }
    
    //--------------------------------------------------------------
    static public func removeValue(key: String, userDefaultsInstance: UserDefaults = UserDefaults.standard)
    {
        userDefaultsInstance.removeObject(forKey: key)
        userDefaultsInstance.synchronize()
    }
    
    //--------------------------------------------------------------
    static public func removeValue(key: String, suiteName: String?)
    {
        guard let userDefaults = UserDefaults.init(suiteName: suiteName) else
        {
            return
        }
        
        UserDefaults.removeValue(key: key, userDefaultsInstance: userDefaults)
    }
}
