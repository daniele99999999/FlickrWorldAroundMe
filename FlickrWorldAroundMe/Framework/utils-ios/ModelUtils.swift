//
//  ModelUtils.swift
//  
//
//  Created by Daniele Salvioni on 03/12/2018.
//  Copyright © 2018 Daniele Salvioni. All rights reserved.
//

import Foundation

public class ModelUtils
{
    public class func generateAutoId() -> String
    {
        return UUID().uuidString
    }
}

