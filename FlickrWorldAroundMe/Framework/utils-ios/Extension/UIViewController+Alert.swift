//
//  UIViewController+Error.swift
//  Watsons
//
//  Created by Daniele Salvioni on 02/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit

extension UIViewController
{
    public func showGenericError(_ error: Error,
                                 title: String = NSLocalizedString("Error", comment: "Error"),
                                 buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                 color: UIColor = UIColor.blue,
                                 completionPresentation: (() -> Void)? = nil,
                                 completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = self.createAlert(title: title, message: error.localizedDescription, preferredStyle: .alert, color: color)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completionOk))
        self.present(alert, animated: true, completion: completionPresentation)
    }
    
    public func showGenericErrorAndRetry(_ error: Error,
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
        self.present(alert, animated: true, completion: completionPresentation)
    }
    
    public func showSuccessMessage(_ message: String?,
                                   title: String = NSLocalizedString("Congratulations", comment: "Congratulations"),
                                   buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                   color: UIColor = UIColor.blue,
                                   completionPresentation: (() -> Void)? = nil,
                                   completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        self.showGenericMessage(message,
                                title: title,
                                buttonTitle: buttonTitle,
                                color: color,
                                completionPresentation: completionPresentation,
                                completionOk: completionOk)
    }
    
    public func showGenericMessage(_ message: String?,
                                   title: String = NSLocalizedString("Attention", comment: "Attention"),
                                   buttonTitle: String = NSLocalizedString("OK", comment: "OK"),
                                   color: UIColor = UIColor.blue,
                                   completionPresentation: (() -> Void)? = nil,
                                   completionOk: ((UIAlertAction) -> Void)? = nil)
    {
        let alert = self.createAlert(title: title, message: message, preferredStyle: .alert, color: color)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: completionOk))
        self.present(alert, animated: true, completion: completionPresentation)
    }
    
    private func createAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style, color: UIColor) -> UIAlertController
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        alert.view.tintColor = color
        return alert
    }
}
