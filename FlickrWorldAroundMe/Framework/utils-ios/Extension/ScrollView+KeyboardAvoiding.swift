//
//  ScrollView+KeyboardAvoiding.swift
//  Watsons
//
//  Created by daniele salvioni on 06/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

//class KeyboardAvoidingScrollView: UIScrollView
extension UIScrollView
{
    static var fixedKeyboardAdjustingHeightFactor: CGFloat = 0
    
    func addKeyboardEventsObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardEventsObserver()
    {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification:Notification)
    {
        self.adjustingHeight(true, notification: notification)
    }
    
    @objc fileprivate func keyboardWillHide(_ notification:Notification)
    {
        self.adjustingHeight(false, notification: notification)
    }
    
    fileprivate func adjustingHeight(_ show:Bool, notification:Notification)
    {
        var userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var changeInHeight = (keyboardFrame.height ) * (show ? 1 : 0)
        
        // inserire personalizzazioni eventuali
        changeInHeight += UIScrollView.fixedKeyboardAdjustingHeightFactor
        
        var contentInsets = self.contentInset
        contentInsets.bottom = changeInHeight
        
        self.contentInset = contentInsets
        self.scrollIndicatorInsets = contentInsets
    }
}
