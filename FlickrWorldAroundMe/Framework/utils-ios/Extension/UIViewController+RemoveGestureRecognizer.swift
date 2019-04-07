//
//  UIViewController+RemoveGestureRecognizer.swift
//  Watsons
//
//  Created by daniele salvioni on 26/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer?)
    {
        if let _gestureRecognizer = gestureRecognizer
        {
            self.view.removeGestureRecognizer(_gestureRecognizer)
        }
    }

}
