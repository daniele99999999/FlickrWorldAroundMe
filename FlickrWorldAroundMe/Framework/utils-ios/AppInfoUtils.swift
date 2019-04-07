//
//  AppInfoUtils.swift
//  
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

public class AppInfoUtils
{
    public class func getAppVersion() -> String
    {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    public class func getAppBuildVersion() -> String
    {
        return (Bundle.main.object(forInfoDictionaryKey: (kCFBundleVersionKey as String?) ?? "")) as? String ?? ""
    }
    
    public class func getAppBundleName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    public class func getAppDisplayName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
    
    public class func getAppExecutableName() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""
    }
    
    public class func getAppProcessName() -> String
    {
        return ProcessInfo.processInfo.processName
    }
    
    public class func getAppFileName() -> String
    {
        let bundlePath: String = Bundle.main.bundlePath
        return FileManager.default.displayName(atPath: bundlePath)
    }
    
    public class func getAppBundleIdentifier() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    public class func getAppBundlePrefix() -> String
    {
        let bundleIdentifier: String = self.getAppBundleIdentifier()
        let bundleName: String = self.getAppBundleName()
        let bundlePrefixWithFinalPoint: String = bundleIdentifier.replacingOccurrences(of: bundleName, with: "")
        var bundlePrefix: String? = nil
        if (((bundlePrefixWithFinalPoint as NSString).substring(from: ((bundlePrefixWithFinalPoint.count ) - 1))) == ".")
        {
            bundlePrefix = (bundlePrefixWithFinalPoint as NSString).substring(to: ((bundlePrefixWithFinalPoint.count) - 1))
        }
        else
        {
            bundlePrefix = bundlePrefixWithFinalPoint
        }
        return bundlePrefix ?? ""
    }
}
