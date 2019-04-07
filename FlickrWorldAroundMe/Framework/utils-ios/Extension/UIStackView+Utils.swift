//
//  UIStackView+Utils.swift
//  Watsons
//
//  Created by Daniele Salvioni on 21/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIStackView
{
    func removeArrangedSubview(_ view: UIView, shouldRemoveFromSuperview: Bool)
    {
        self.removeArrangedSubview(view)
        if shouldRemoveFromSuperview
        {
            view.removeFromSuperview()
        }
    }
}
