//
//  UIImage+Math.swift
//  Watsons
//
//  Created by Daniele Salvioni on 31/03/19.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIImage
{
    var aspectRatio: CGFloat
    {
        get
        {
            if self.size.height != 0
            {
                return self.size.width/self.size.height
            }
            else
            {
                return 0
            }
        }
    }
}
