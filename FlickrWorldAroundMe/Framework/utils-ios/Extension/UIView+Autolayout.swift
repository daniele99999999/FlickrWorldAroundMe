//
//  UIView+Autolayout.swift
//  Watsons
//
//  Created by Daniele Salvioni on 16/03/19.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIView
{
    class func autoLayoutInit<T>() -> T where T: UIView
    {
        let view = T(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIButton
{
    class func autoLayoutInit<T>(type: UIButton.ButtonType) -> T where T: UIButton
    {
        let view = T(type: type)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIImageView
{
    class func autoLayoutInit<T>(image: UIImage?, highlightedImage: UIImage? = nil) -> T where T: UIImageView
    {
        let view = T(image: image, highlightedImage: highlightedImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIView
{
    func autoPinEdgesToSuperview(margin: UIEdgeInsets = .zero)
    {
        guard let superview = self.superview else { return }
        
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: -margin.top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin.bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: -margin.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin.right).isActive = true
    }
}

extension UIView
{
    func replaceConstraint(_ constraint: NSLayoutConstraint?, withConstraint: NSLayoutConstraint) -> NSLayoutConstraint
    {
        if let _constraint = constraint { self.removeConstraint(_constraint) }
        self.addConstraint(withConstraint)
        return withConstraint
    }
}

extension UIImageView
{
    func replaceARConstraint(_ arConstraint: NSLayoutConstraint?) -> NSLayoutConstraint?
    {
        guard let _image = self.image, let _arConstraint = arConstraint, let _firstItem = _arConstraint.firstItem else { return nil }
        
        let newARConstraint = NSLayoutConstraint(item: _firstItem,
                                                 attribute: _arConstraint.firstAttribute,
                                                 relatedBy: _arConstraint.relation,
                                                 toItem: _arConstraint.secondItem,
                                                 attribute: _arConstraint.secondAttribute,
                                                 multiplier: _image.aspectRatio,
                                                 constant: 0.0)
        self.removeConstraint(_arConstraint)
        self.addConstraint(newARConstraint)
        self.superview?.setNeedsLayout()
        return newARConstraint
    }
}


////--------------------------------------------------------------
//+ (NSLayoutConstraint*)replaceAspectRatioConstraint:(NSLayoutConstraint*)aspectRatioConstraint
//inImageView:(UIImageView*)imageView
//{
//    NSLayoutConstraint* newAspectRatio = [NSLayoutConstraint constraintWithItem:aspectRatioConstraint.firstItem
//        attribute:aspectRatioConstraint.firstAttribute
//        relatedBy:aspectRatioConstraint.relation
//        toItem:aspectRatioConstraint.secondItem
//        attribute:aspectRatioConstraint.secondAttribute
//        multiplier:(imageView.image.size.width/imageView.image.size.height)
//        constant:0.0];
//    [imageView removeConstraint:aspectRatioConstraint];
//    [imageView addConstraint:newAspectRatio];
//    [imageView.superview setNeedsLayout];
//    return newAspectRatio;
//}
