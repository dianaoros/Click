//
//  Member.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public typealias MemberId = Int64

public struct Member: Decodable, Encodable, Sendable, Identifiable {
    public var id: MemberId
    public var firstName: String
    public var lastName: String
    public var phoneNumber: String?
    public var email: String
    public var address: Address
}

struct AddMemberParameters: Encodable {
    //check what's needed
    let firstName: String
    let lastName: String
    public var phoneNumber: String?
    public var email: String
    let address: Address
    let authUserId: String
}

struct UpdateMemberParameters: Encodable {
    //check what's needed
    let firstName: String
    let lastName: String
    let phoneNumber: String?
    let email: String
    let address: Address
}

struct AddEmail: Encodable {
    let email: String
}

struct AddPhoneNumber: Encodable {
    let phoneNumber: String
}

struct VerifyCode: Encodable {
    let otpCode: String
}
