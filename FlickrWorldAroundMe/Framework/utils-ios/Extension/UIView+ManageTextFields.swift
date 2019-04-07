//
//  UIView+ManageTextFields.swift
//  Watsons
//
//  Created by Daniele Salvioni on 03/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit
import SwifterSwift

extension UIView
{
    func findTextFieldsSubclassAndSetDelegateTo<T: UITextField>(delegate: UITextFieldDelegate) -> [T]
    {
        var textFieldElements = [T]()
        
        for subview in self.subviews
        {
            if let textFieldElement = subview as? T
            {
                textFieldElements.append(textFieldElement)
                textFieldElement.delegate = delegate
            }
            else
            {
                let newTextFieldElements: [T] = subview.findTextFieldsSubclassAndSetDelegateTo(delegate: delegate)
                textFieldElements += newTextFieldElements
            }
        }
        
        return textFieldElements
    }
}

extension UITextField
{
    func nextResponder<T: UITextField>(textFields: [T]) -> T?
    {
        guard let currentIndex = textFields.index(where: { $0 == self }) else { return nil }
        return textFields.item(at: currentIndex+1)
    }
    
    class func updateDefaultReturnKey<T: UITextField>(textFields: [T])
    {
        for textField in textFields
        {
            textField.returnKeyType = .next
        }
        if !textFields.isEmpty
        {
            textFields[textFields.count-1].returnKeyType = .done
        }
    }
}
