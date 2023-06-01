//
//  Endpoint.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public protocol Endpoint: Sendable {
    var path: String { get }
}
