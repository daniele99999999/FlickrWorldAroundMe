//
//  UIImageView+AsyncLoad.swift
//  Watsons
//
//  Created by Daniele Salvioni on 30/03/19.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit
import SwifterSwift
import SDWebImage

extension UIImageView
{
    func loadImage(urlString: String?,
                   placeholder: UIImage? = nil,
                   replaceARConstraint: NSLayoutConstraint? = nil,
                   thresholdAR: CGFloat = 0.1,
                   completion: ((UIImage?, NSLayoutConstraint?, Error?) -> Void)? = nil)
    {
        self.image = placeholder
        let oldImage = self.image
        
        self.sd_setImage(with: urlString?.url,
                         placeholderImage: placeholder,
                         options: [.retryFailed]) //options: [])
        { [weak self] (image, error, cacheType, url) in
            if let _error = error { self?.image = placeholder; completion?(nil, nil, _error); return }
            guard let _newImage = image, let _oldImage = oldImage else { completion?(nil, nil, nil); return }
            
//            let percentage = abs(_newImage.aspectRatio - _oldImage.aspectRatio)/_oldImage.aspectRatio
//            if percentage > thresholdAR
            if (_oldImage.aspectRatio != 0) || (abs(_newImage.aspectRatio - _oldImage.aspectRatio)/_oldImage.aspectRatio > thresholdAR)
            {
                let newARConstraint = self?.replaceARConstraint(replaceARConstraint)
                self?.superview?.setNeedsLayout()
                completion?(image, newARConstraint, nil)
            }
            else
            {
                completion?(image, nil, nil)
            }
        }
    }
    
    func cancelPendingLoad()
    {
        self.sd_cancelCurrentImageLoad()
    }
}
