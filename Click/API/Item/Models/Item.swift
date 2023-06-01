//
//  Item.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public typealias ItemId = String

public struct Item: Codable, Sendable, Identifiable {
    public var id: ItemId
    public var name: String
    public var price: String
}

extension Item {
    public struct Detail: Codable, Sendable, Hashable {
        public var imageUrl: String // handle multiple photos for item
        public var productDetails: String
        public var brand: String
        public var description: String?
        public var color: String?
    }
}

extension Item {
    public struct Quantity: Codable, Sendable, Hashable {
        public var quantityInStock: Int
        public var quantityToOrder: Int?
    }
}
