//
//  UIViewController+EndEditing.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func hideKeyboardWhenTappedAround(cancelTouches: Bool = false) -> UITapGestureRecognizer
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelTouches
        self.view.addGestureRecognizer(tap)
        return tap
    }

    @objc func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
}
