//
//  AlertUtils.swift
//  
//
//  Created by Daniele Salvioni on 04/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import UIKit

public class AlertUtils
{
    public class func showGenericError(_ error: Error,
                                       title: String = NSLocalizedString("Error", comment: "Error"),
                                       buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                       color: UIColor = UIColor.blue,
                                       completionPresentation: (() -> Void)? = nil,
                                       completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = self.createAlert(title: title, message: error.localizedDescription, preferredStyle: .alert, color: color)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completionOk))
        UIApplication.topViewController()?.present(alert, animated: true, completion: completionPresentation)
    }
    
    public class func showGenericErrorAndRetry(_ error: Error,
                                               title: String = NSLocalizedString("Error", comment: "Error"),
                                               buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                               retryTitle: String = NSLocalizedString("Retry", comment: "Retry"),
                                               color: UIColor = UIColor.blue,
                                               completionPresentation: (() -> Void)? = nil,
                                               completionOk: ((UIAlertAction) -> Void)? = nil,
                                               completionRetry: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = self.createAlert(title: title, message: error.localizedDescription, preferredStyle: .alert, color: color)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completionOk))
        alert.addAction(UIAlertAction(title: retryTitle, style: .default, handler: completionRetry))
        UIApplication.topViewController()?.present(alert, animated: true, completion: completionPresentation)
    }
    
    public func showSuccessMessage(_ message: String?,
                                   title: String = NSLocalizedString("Congratulations", comment: "Congratulations"),
                                   buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                   color: UIColor = UIColor.blue,
                                   completionPresentation: (() -> Void)? = nil,
                                   completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        AlertUtils.showGenericMessage(message,
                                      title: title,
                                      buttonTitle: buttonTitle,
                                      color: color,
                                      completionPresentation: completionPresentation,
                                      completionOk: completionOk)
    }
    
    public class func showGenericMessage(_ message: String?,
                                         title: String = NSLocalizedString("Attention", comment: "Attention"),
                                         buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                         color: UIColor = UIColor.blue,
                                         completionPresentation: (() -> Void)? = nil,
                                         completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = self.createAlert(title: title, message: message, preferredStyle: .alert, color: color)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completionOk))
        UIApplication.topViewController()?.present(alert, animated: true, completion: completionPresentation)
    }
    
    private class func createAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style, color: UIColor) -> UIAlertController
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        alert.view.tintColor = color
        return alert
    }
}
