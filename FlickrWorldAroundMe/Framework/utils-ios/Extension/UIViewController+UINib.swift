//
//  UIViewController+UINib.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController
{
    public class func loadFromXib<T>() -> T where T: UIViewController
    {
        let bundle = Bundle(for: self)
        let viewControllerName = String(describing: self)
        
        return T(nibName: viewControllerName, bundle: bundle)
    }
    
    public class func loadFromXib<T>(withOwner: Any?, options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIViewController
    {
        let bundle = Bundle(for: self)
        let viewControllerName = String(describing: self)
        
        let nib = UINib(nibName: viewControllerName, bundle: bundle)
        guard let viewController = nib.instantiate(withOwner: withOwner, options: options).first as? T else
        {
            fatalError("Could not load \(viewControllerName) from xib file.")
        }
        return viewController
    }
}
