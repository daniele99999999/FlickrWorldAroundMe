//
//  UICollectionViewCell+Animation.swift
//  Watsons
//
//  Created by daniele salvioni on 20/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UICollectionViewCell
{
    func displayAnimateFade(duration: TimeInterval = 0.5, startingAlpha: CGFloat = 0.0)
    {
        self.alpha = startingAlpha
        
        UIView.animate(withDuration: duration)
        {
            self.alpha = 1.0
        }
    }
    
    func displayAnimateFadeAndScale(duration: TimeInterval = 0.5, startingAlpha: CGFloat = 0.0, startingScale: CGFloat = 0.5)
    {
        self.alpha = startingAlpha
        self.layer.transform = CATransform3DMakeScale(startingScale, startingScale, startingScale)
        
        UIView.animate(withDuration: duration)
        {
            self.alpha = 1.0
            self.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
    }
    
    func displayAnimateSlideIn(duration: TimeInterval = 0.5, startingX: CGFloat)
    {
        self.transform = CGAffineTransform(translationX: startingX, y: 0)
        
        UIView.animate(withDuration: duration)
        {
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    func displayAnimateBounceAndUp(duration: TimeInterval = 2.0, springFactor: CGFloat = 0.25, verticalSlide: CGFloat = 30.0)
    {
        self.transform = CGAffineTransform(translationX: 0, y: verticalSlide)
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: springFactor,
            initialSpringVelocity: 0.0,
            options: [.curveEaseInOut],
            animations:
        {
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func displayAnimateFadeAndUp(duration: TimeInterval = 0.5, verticalSlide: CGFloat = 30.0, startingAlpha: CGFloat = 0.0)
    {
        self.transform = CGAffineTransform(translationX: 0, y: verticalSlide)
        self.alpha = startingAlpha
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: [.curveEaseInOut],
            animations:
        {
            self.alpha = 1.0
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
}
