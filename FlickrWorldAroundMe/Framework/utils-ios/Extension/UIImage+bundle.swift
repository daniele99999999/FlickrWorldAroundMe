//
//  UIImage+Bundle.swift
//
//
//  Created by Daniele Salvioni on 12/12/2017.
//  Copyright © 2017 Daniele Salvioni. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    public static func imageFromBundle(name:String, bundleName: String, classInModule: AnyClass? = nil) -> UIImage?
    {
        var image: UIImage? = nil
        
        let selectedBundle: Bundle
        if let classInModule = classInModule
        {
            selectedBundle = Bundle(for: classInModule)
        }
        else
        {
            selectedBundle = Bundle.main
        }
        
        if let bundleURL = selectedBundle.url(forResource: bundleName, withExtension: "bundle")
        {
            if let bundle = Bundle(url: bundleURL)
            {
                image = UIImage(named: name, in: bundle, compatibleWith: nil)
            }
            else
            {
                debugPrint("Could not load the bundle")
            }
        }
        else
        {
            debugPrint("Could not create a path to the bundle")
        }
        
        return image
    }
}
