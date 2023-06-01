//
//  NetworkError.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

public struct StatusError: Error {
    public let code: Int
}

public extension Network {
    func process(_ error: StatusError, map values: [Int: Error]) -> Error {
        values[error.code] ?? error
    }
}
