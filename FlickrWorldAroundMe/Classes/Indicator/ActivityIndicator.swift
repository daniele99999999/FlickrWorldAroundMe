//
//  ActivityIndicator.swift
//  
//
//  Created by Daniele Salvioni on 05/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import SwiftSpinner

public class ActivityIndicator: ActivityIndicatorProtocol
{
    public func showActivityIndicator(_ title: String?)
    {
        SwiftSpinner.show(title ?? Constants.Localize.Activity.loadingTitleMessage)
    }
    
    public func showActivityIndicatorSuccess(_ title: String?)
    {
        SwiftSpinner.show(duration: 1.0, title: title ?? Constants.Localize.Activity.successTitleMessage, animated: false)
    }
    
    public func showActivityIndicatorFailure(_ title: String?)
    {
        SwiftSpinner.show(duration: 1.0, title: title ?? Constants.Localize.Activity.failureTitleMessage, animated: false)
    }
    
    public func hideActivityIndicator()
    {
        SwiftSpinner.hide()
    }
}

