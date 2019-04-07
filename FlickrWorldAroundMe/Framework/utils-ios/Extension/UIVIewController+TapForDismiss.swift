//
//  UIVIewController+TapForDismiss.swift
//  Watsons
//
//  Created by Daniele Salvioni on 26/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    var isModalForAutoDismiss: Bool
    {
        get
        {
            return (self.presentingViewController?.presentedViewController == self) ||
                   ((self.navigationController != nil) && (self.presentingViewController?.presentedViewController == self.navigationController))
            
        }
    }
    
    func dismissWhenTappedAround(cancelTouches: Bool = false) -> UITapGestureRecognizer
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissSelf))
        tap.cancelsTouchesInView = cancelTouches
        self.view.addGestureRecognizer(tap)
        return tap
    }
    
    
    
    
    @objc func dismissSelf()
    {
        if self.isModalForAutoDismiss
        {
            self.dismiss(animated: true, completion: {})
        }
    }
}
