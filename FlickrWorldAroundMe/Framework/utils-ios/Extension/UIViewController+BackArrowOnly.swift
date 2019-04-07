//
//  UIViewController+BackArrowOnly.swift
//  Watsons
//
//  Created by daniele salvioni on 06/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIViewController
{
    func showBackArrowOnly()
    {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
