//
//  StorageUtils.swift
//  
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

public class StorageUtils
{
    public class func loadPlist(name: String, rootKey: String?, bundle: Bundle = Bundle.main) -> Dictionary<String, Any>?
    {
        guard let path = bundle.url(forResource: name, withExtension: "plist") else
        {// genero il path
            return nil
        }
        
        guard let data = try? Data(contentsOf: path) else
        {// carico i dati
            return nil
        }
        
        guard let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] ?? [:] else
        {// converto in plist e in dictionary
            return nil
        }
        
        if let rootKey = rootKey
        {// ho passato la root -> estraggo il dictionary interno
            
            guard let plistSubDictionary = plistDictionary[rootKey] as? [String: Any] else
            {
                return nil
            }
            
            return plistSubDictionary
        }
        else
        {// non ho passato la root -> restituisco tutto il plist
            return plistDictionary
        }
    }
    
    public class func loadJSON(name: String, bundle: Bundle = Bundle.main) -> Dictionary<String, Any>?
    {
        guard let path = bundle.url(forResource: name, withExtension: "json") else
        {// genero il path
            return nil
        }
        
        guard let data = try? Data(contentsOf: path) else
        {// carico i dati
            return nil
        }
        
        guard let JSONDictionary = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] else
        {// converto in plist e in dictionary
            return nil
        }
        
        return JSONDictionary
    }
    
    public class func loadJSON(name: String, bundle: Bundle = Bundle.main) -> Data?
    {
        guard let path = bundle.url(forResource: name, withExtension: "json") else
        {// genero il path
            return nil
        }
        
        guard let data = try? Data(contentsOf: path) else
        {// carico i dati
            return nil
        }
        
        return data
    }
    
    public class func loadJSON(name: String, bundle: Bundle = Bundle.main) -> String?
    {
        guard let path = bundle.url(forResource: name, withExtension: "json") else
        {// genero il path
            return nil
        }
        
        guard let data = try? Data(contentsOf: path) else
        {// carico i dati
            return nil
        }
        
        return data.string(encoding: .utf8)
    }
}
