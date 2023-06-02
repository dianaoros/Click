//
//  Router.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public final class Router: ObservableObject {
    @Published public var path = NavigationPath()
    
    public init() {}
    
    public func push<Value>(_ value: Value) where Value: Codable, Value: Hashable {
        path.append(value)
    }
}
