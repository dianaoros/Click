//
//  Network+Member.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

enum MemberApi: Endpoint {
    case me
    case member(MemberId)
    case addMember
    case isMember
    case email
    case address
    case phoneNumber
    case sendCode
    case deleteMember(MemberId)
    case generateDeleteAccountCode(MemberId)
    case verifyDeleteAccountCode(MemberId, String)
    
    var path: String {
        switch self {
        case .me: return "member/authenticatedMember" // done
        case let .member(id): return "member/\(id)" // done
        case .addMember: return "member" // done
        case .isMember: return "member/isMember" //done
        case .email: return "member/email"
        case .address: return "member/address"
        case .phoneNumber: return "member/phoneNumber"
        case .sendCode: return "member/sendCode"
        case .deleteMember(let id): return "member\(id)" // done
        case .generateDeleteAccountCode(let id): return "member/\(id)/otp"
        case .verifyDeleteAccountCode(let id, let code): return "member/\(id)/otp/\(code)"
        }
    }
}

public extension Network {
    func me() async throws -> Member {
        try await get(MemberApi.me)
    }
    
    func isMember() async -> Bool {
        do {
            return try await get(MemberApi.isMember)
        } catch {
            return false
        }
    }
    
    func member(id: MemberId) async throws -> Member {
        try await get(MemberApi.member(id))
    }
    
    @discardableResult
    func addMember(firstName: String, lastName: String,
                   phoneNumber: String?, email: String, address: Address,
                   authUserId: String) async throws -> Member {
        try await post(MemberApi.addMember, parameters: AddMemberParameters(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber ?? "", email: email, address: address, authUserId: authUserId))
    }
    
    func updateMember(id: MemberId, firstName: String, lastName: String,
                      phoneNumber: String?, email: String, address: Address) async throws -> Member {
        try await put(MemberApi.member(id), parameters: UpdateMemberParameters(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email, address: address))
    }
    
    @discardableResult
    func updateEmail(_ email: String) async throws -> Bool {
        try await post(MemberApi.email, parameters: AddEmail(email: email))
    }
    
    @discardableResult
    func updatePhoneNumber(_ phoneNumber: String) async throws -> Bool {
        try await post(MemberApi.phoneNumber, parameters: AddPhoneNumber(phoneNumber: phoneNumber))
    }
    
    @discardableResult
    func addAddress(_ address: Address) async throws -> Bool {
        try await post(MemberApi.address, parameters: AddAddressParameters(address: address.address, addressOptional: address.addressOptional, city: address.city, state: address.state, zipcode: address.zipcode))
    }
    
    func updateAddress(_ address: Address) async throws -> Bool {
        try await post(MemberApi.address, parameters: UpdateAddressParameters(address: address.address, addressOptional: address.addressOptional, city: address.city, state: address.state, zipcode: address.zipcode))
    }
    
    @discardableResult
    func sendCode() async throws -> Bool {
        try await post(MemberApi.sendCode)
    }
    
    func deleteMember(id: MemberId) async throws {
        try await delete(MemberApi.deleteMember(id))
    }
    
    @discardableResult
    func sendDeleteAccountCode(id: MemberId) async throws -> Bool {
        try await post(MemberApi.generateDeleteAccountCode(id))
    }
    
    @discardableResult
    func verifyDeleteAccountCode(id: MemberId, code: String) async throws -> Bool {
        try await get(MemberApi.verifyDeleteAccountCode(id, code))
    }
    
}
