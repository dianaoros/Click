//
//  Serialization.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

protocol DataEncoder {
    static func encode<T: Encodable>(_ data: T) throws -> Self
}

protocol DataDecoder {
    func decode<T: Decodable>() throws -> T
}

extension Data: DataEncoder, DataDecoder {
    static func encode<T: Encodable>(_ data: T) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .useDefaultKeys
        return try encoder.encode(data)
    }
    
    func decode<T: Decodable>() throws -> T {
        if let data = self as? T {
            return data
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: self)
    }
}
