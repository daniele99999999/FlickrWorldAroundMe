//
//  UiViewController+UIStoryboard.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController
{
    public class func loadFromStoryboard<T>(storyboardName: String, bundle: Bundle? = nil) -> T where T: UIViewController
    {
        let bundle = Bundle(for: self)
        let viewControllerName = String(describing: self)
        
        guard let viewController = UIStoryboard(name: storyboardName, bundle: bundle).instantiateViewController(withIdentifier: viewControllerName) as? T else
        {
            fatalError("Could not load \(viewControllerName) from \(storyboardName) file.")
        }
        return viewController
    }
}
