//
//  UIView+Animate.swift
//  Watsons
//
//  Created by daniele salvioni on 26/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIView
{
    func hiddenAnimated(hidden: Bool,
                        duration: TimeInterval = 0.25,
                        clampingAlpha: CGFloat = 1.0,
                        completion: (() -> Void)? = nil)
    {
        // forzo i valori iniziali
        if self.isHidden
        {
            if !hidden
            {
                self.alpha = 0.0
                self.isHidden = false
            }
            else
            {
                if let complete = completion { complete() }
                return
            }
        }
        else
        {
            if !hidden
            {
                if let complete = completion { complete() }
                return
            }
        }
        
        // eseguo animazione
        UIView.animate(withDuration: duration,
                       animations:
        {
            self.alpha = hidden ? 0.0 : clampingAlpha
        })
        { (value: Bool) in
            self.isHidden = hidden
            // ripristino alpha
            self.alpha = clampingAlpha
            if let complete = completion { complete() }
        }
    }

    func constraintAnimated(constraint: NSLayoutConstraint,
                            constraintFinalVaue: CGFloat,
                            duration: TimeInterval = 0.25,
                            springValue: CGFloat = 1.0,
                            options: UIView.AnimationOptions = [],
                            completion: (() -> Void)? = nil)
    {
        self.superview?.layoutIfNeeded()
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: springValue,
                       initialSpringVelocity: 0,
                       options: options,
                       animations:
        {
            constraint.constant = constraintFinalVaue
            self.superview?.layoutIfNeeded()
        })
        { (finished) in
            constraint.constant = constraintFinalVaue
            if let complete = completion { complete() }
        }
    }
}
