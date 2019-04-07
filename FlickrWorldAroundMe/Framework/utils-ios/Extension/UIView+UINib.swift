//
//  UIView+UINib.swift
//
//
//  Created by daniele salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

public extension UIView
{
    public class func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIView
    {
        let bundle = Bundle(for: self)
        let viewName = String(describing: self)
        
        let nib = UINib(nibName: viewName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else
        {
            fatalError("Could not load \(viewName) from xib file.")
        }
        return view
    }
}
