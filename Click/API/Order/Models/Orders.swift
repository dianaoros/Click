//
//  Orders.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public typealias OrderId = String

public struct Order: Codable, Sendable, Identifiable {
    public var id: OrderId
    public var orderDate: Date
    public var member: Member
    public var items: [Item]
}
extension Order {
    public struct Price: Codable, Sendable {
        public var subtotal: String
        public var salesTax: String
        public var total: String
    }
}

public struct PastOrders: Codable, Sendable {
    var orders: [Order]
}

public struct CurrentOrder: Codable, Sendable {
    var order: Order
}
// past orders
// current orders
