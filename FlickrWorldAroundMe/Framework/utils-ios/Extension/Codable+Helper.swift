//
//  Codable+Helper.swift
//  Watsons
//
//  Created by Daniele Salvioni on 24/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import Foundation

extension Decodable
{
    static func decode<T: Decodable>(_ data: Data?) -> T?
    {
        guard let _data = data else { return nil }
        return try? JSONDecoder().decode(T.self, from: _data)
    }
}

extension Encodable
{
    func encode() -> Data?
    {
        return try? JSONEncoder().encode(self)
    }
}
