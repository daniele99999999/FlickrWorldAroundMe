//
//  UIVIewController+TapForSelector.swift
//  Watsons
//
//  Created by daniele salvioni on 26/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func listenWhenTappedAround(cancelTouches: Bool = false, inView: UIView? = nil) -> UITapGestureRecognizer
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.tappedAroundCallback))
        tap.cancelsTouchesInView = cancelTouches
        if let _inView = inView
        {
            _inView.addGestureRecognizer(tap)
        }
        else
        {
            self.view.addGestureRecognizer(tap)
        }
        
        return tap
    }
    
    @objc func tappedAroundCallback()
    {
        Log.debug("tappedAroundCallback: Override for do something")
    }
}
