//
//  Address.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public struct Address: Decodable, Encodable, Sendable {
    // TODO: - add countries
    //public var country: Country
    public var address: String
    public var addressOptional: String?
    public var city: String
    public var state: String
    public var zipcode: String
}

struct AddAddressParameters: Encodable {
    // TODO: - add countries
    //public var country: Country
    let address: String
    let addressOptional: String?
    let city: String
    let state: String
    let zipcode: String
}

struct UpdateAddressParameters: Encodable {
    // TODO: - add countries
    //public var country: Country
    //check what's needed
    let address: String
    let addressOptional: String?
    let city: String
    let state: String
    let zipcode: String
}


//Differentiate between shipping address and billing address
public struct ShippingAddress {
    let address: Address
}

public struct DeliveryAddress {
    let address: Address
}
