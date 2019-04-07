//
//  ActivityIndicatorProtocol.swift
//  
//
//  Created by Daniele Salvioni on 05/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation

public protocol ActivityIndicatorProtocol: class
{
    func showActivityIndicator(_ title: String?)
    func showActivityIndicatorSuccess(_ title: String?)
    func showActivityIndicatorFailure(_ title: String?)
    func hideActivityIndicator()
}
