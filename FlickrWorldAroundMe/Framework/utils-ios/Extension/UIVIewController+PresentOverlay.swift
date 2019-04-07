//
//  UIVIewController+PresentOverlay.swift
//  Watsons
//
//  Created by daniele salvioni on 22/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func presentModallyInOverlay(viewController: UIViewController, transitionStyle: UIModalTransitionStyle = .crossDissolve, animated: Bool = true, completion: @escaping () -> Void)
    {
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = transitionStyle
        self.present(viewController, animated: animated, completion: completion)
    }
}
