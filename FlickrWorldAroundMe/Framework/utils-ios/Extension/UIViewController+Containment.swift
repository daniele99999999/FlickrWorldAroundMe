//
//  UIViewController+Containment.swift
//  Watsons
//
//  Created by daniele salvioni on 19/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

@nonobjc extension UIViewController
{
    func addChildVC(_ child: UIViewController, container: UIView, frame: CGRect? = nil)
    {
        #if swift(>=4.2)
        self.addChild(child)
        #else
        self.addChildViewController(child)
        #endif
        
        if let frame = frame
        {
            child.view.frame = frame
        }
        else
        {
            child.view.frame = container.frame
        }
        
        container.addSubview(child.view)
        
        #if swift(>=4.2)
        child.didMove(toParent: self)
        #else
        child.didMove(toParentViewController: self)
        #endif
        
    }
    
    func removeFromParentVC()
    {
        guard self.parent != nil else { return }
        
        #if swift(>=4.2)
        self.willMove(toParent: nil)
        #else
        self.willMove(toParentViewController:nil)
        #endif
        
        self.view.removeFromSuperview()
        
        #if swift(>=4.2)
        self.removeFromParent()
        #else
        self.removeFromParentViewController()
        #endif
    }
    
    func substituteChildVC(_ child: UIViewController, container: UIView, frame: CGRect? = nil)
    {
        #if swift(>=4.2)
        let allChildren = children
        #else
        let allChildren = childViewControllers
        #endif
        
        for childVC in allChildren
        {
            if childVC.view.superview == container
            {
                childVC.removeFromParentVC()
            }
        }
        
        self.addChildVC(child, container: container, frame: frame)
    }
}
