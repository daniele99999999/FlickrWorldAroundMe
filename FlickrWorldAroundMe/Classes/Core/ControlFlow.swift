//
//  ControlFlow.swift
//  FlickrWorldAroundMe
//
//  Created by Daniele Salvioni on 24/03/2019.
//  Copyright © 2019 Daniele Salvioni. All rights reserved.
//

import UIKit

class ControlFlow
{
    private class func setupRootController(window: UIWindow?)
    {
        let rootVC = ViewController.createOne(service: CoreManager.shared.service,
                                              locationManager: CoreManager.shared.locationManager,
                                              activity: CoreManager.shared.activityIndicator)
        (window?.rootViewController as? UINavigationController)?.setViewControllers([rootVC], animated: false)
    }
    
    class func flowAppBoot(window: UIWindow?)
    {
        self.flowStart(window: window)
    }
    
    class func flowStart(window: UIWindow?)
    {
        self.setupRootController(window: window)
    }
}
