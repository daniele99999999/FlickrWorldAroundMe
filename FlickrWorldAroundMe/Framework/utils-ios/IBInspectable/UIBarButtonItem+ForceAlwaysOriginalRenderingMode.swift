//
//  UIBarButtonItem+ForceAlwaysOriginalRenderingMode.swift
//  Watsons
//
//  Created by daniele salvioni on 05/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIBarButtonItem
{
    @IBInspectable var imageRenderingModeOriginal: Bool
    {
        get
        {
            guard let _image = self.image else { return false }
            return _image.renderingMode == .alwaysOriginal
        }
        set
        {
            if newValue
            {
                self.image = self.image?.withRenderingMode(.alwaysOriginal) ?? nil
            }
        }
    }
}
