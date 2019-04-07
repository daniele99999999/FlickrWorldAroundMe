//
//  UITextField+IBInspectable.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor
    {
        get
        {
            return self.placeHolderColor
        }
        
        set
        {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue])
        }
    }
    
//    @IBInspectable var paddingLeft: CGFloat
//    {
//        get
//        {
//            return self.leftView?.frame.size.width ?? 0
//        }
//
//        set
//        {
//            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
//            self.leftView = paddingView
//            self.leftViewMode = .always
//        }
//    }
}

//extension UIView
//{
//    @objc func setImage(_ image: UIImage?)
//    {
//        if let _self = self as? UIImageView
//        {
//            _self.image = image
//        }
//    }
//}
