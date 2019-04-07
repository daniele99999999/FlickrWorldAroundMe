//
//  NSMutableAttributedString+MultipleColors.swift
//  Watsons
//
//  Created by daniele salvioni on 06/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString
{
    func setColorForText(textForAttribute: String, withColor color: UIColor)
    {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, withFont font: UIFont)
    {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
