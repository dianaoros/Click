//
//  Bag.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

// items in bag
// save in core data or realm maybe instead of making networking calls
public struct Bag: Codable, Sendable, Identifiable {
    public var id: String
    public var items: [Item]
    public var price: Order.Price //?
}

// TODO: item quantity in cart
// TODO: add item + remove item + order all
