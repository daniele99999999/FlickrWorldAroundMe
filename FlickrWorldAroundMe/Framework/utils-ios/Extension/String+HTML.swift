//
//  String+HTML.swift
//  Marionnaud
//
//  Created by daniele salvioni on 20/12/2018.
//  Copyright © 2018 Ovolab. All rights reserved.
//

import UIKit

extension String
{
    func convertHtml() -> NSAttributedString
    {
        guard let data = data(using: .utf8, allowLossyConversion: true) else { return NSAttributedString() }
        do
        {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch
        {
            return NSAttributedString()
        }
    }
}
