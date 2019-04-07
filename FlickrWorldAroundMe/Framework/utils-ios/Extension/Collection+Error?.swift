//
//  Collection+Nil.swift
//  Watsons
//
//  Created by Daniele Salvioni on 03/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation

//extension Collection where Element == Optional<Any>
//{
//    func allNotNil() -> Bool
//    {
//        return self.compactMap { $0 }.count > self.count
//    }
//
//    func atleastOneNotNil() -> Bool
//    {
//        return self.compactMap { $0 }.count > 0
//    }
//
//    func allNil() -> Bool
//    {
//        return self.compactMap { $0 }.count == 0
//    }
//}

extension Collection where Element == Error?
{
    func allNotNil() -> Bool
    {
        return self.compactMap { $0 }.count > self.count
    }
    
    func atleastOneNotNil() -> Bool
    {
        return self.compactMap { $0 }.count > 0
    }
    
    func allNil() -> Bool
    {
        return self.compactMap { $0 }.count == 0
    }
}
