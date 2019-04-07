//
//  String+Regex.swift
//  Marionnaud
//
//  Created by daniele salvioni on 13/01/2019.
//  Copyright © 2019 Ovolab. All rights reserved.
//

import Foundation

extension String
{
    public func matches(pattern: String) -> Bool
    {
        return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
