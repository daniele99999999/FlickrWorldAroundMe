//
//  SystemUtils.swift
//  
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwifterSwift

public class SystemUtils
{
    public class func isPad() -> Bool
    {
        return (UIDevice.current.userInterfaceIdiom == .pad)
    }
    
    public class func preferredLocaleLanguageCode() -> String
    {
        let preferredLanguageCode = Locale.preferredLanguages[0]
        
        return preferredLanguageCode
    }
    
    public class func backgroundDelay(after: Double = 0.0, completion: @escaping () -> Void)
    {
        DispatchQueue.global().asyncAfter(deadline: .now() + after) { completion() }
    }
    
    public class func mainDelay(after: Double = 0.0, completion: @escaping () -> Void)
    {
        if !(after > 0.0 || !Thread.isMainThread) { completion(); return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + after) { completion() }
    }
}
