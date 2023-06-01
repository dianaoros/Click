//
//  Network+Orders.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

enum OrdersApi: Endpoint {
    case allOrders
    case currentOrder
    case cancelCurrentOrder
    case pastOrders
    case cancelledOrders
    
    var path: String {
        switch self {
        case .allOrders: return "orders"
        case .currentOrder: return "orders/currentOrder"
        case .cancelCurrentOrder: return "orders/currentOrder"
        case .pastOrders: return "orders/pastOrders"
        case .cancelledOrders: return "orders/cancelledOrders"
        }
    }
}

extension Network {
    func allOrders(memberId: MemberId) async throws -> [Order] {
        try await get(OrdersApi.allOrders, queryItems: ["memberId": "\(memberId)"])
    }
    
    func currentOrder(memberId: MemberId) async throws -> CurrentOrder {
        try await get(OrdersApi.currentOrder, queryItems: ["memberId": "\(memberId)"])
    }
    
    @discardableResult
    func cancelCurrentOrder(orderId: OrderId) async throws -> Bool {
        try await delete(OrdersApi.cancelCurrentOrder, parameters: orderId)
    }
    
    func pastOrders(memberId: MemberId) async throws -> [Order] {
        try await get(OrdersApi.pastOrders, queryItems: ["memberId": "\(memberId)"])
    }
    
    func cancelledOrders(memberId: MemberId) async throws -> [Order] {
        try await get(OrdersApi.cancelledOrders, queryItems: ["memberId": "\(memberId)"])
    }
}
