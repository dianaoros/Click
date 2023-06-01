//
//  Network+Password.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

enum PasswordAPI: Endpoint {
    case update
    case verifyCode
    case sendCode

    var path: String {
        switch self {
        case .update: return "password/updatePassword"
        case .verifyCode: return "password/verifyCode"
        case .sendCode: return "password/sendCode"
        }
    }
}

public extension Network {
    func updatePassword(email: String, newPasswrod: String, code: String) async throws -> Bool {
        try await post(PasswordAPI.update, parameters: NewPassword(email: email, newPassword: newPasswrod, otpCode: code))
    }
    
    func verifyResetPasswordCode(email: String, code: String) async throws -> Bool {
        try await post(PasswordAPI.verifyCode, parameters: PasswordRecoveryVerify(email: email, otpCode: code))
    }
    
    func sendResetPasswordCode(email: String) async throws -> Bool {
        do {
            return try await post(PasswordAPI.sendCode, parameters: PasswordRecovery(email: email))
        } catch let error as StatusError {
            throw process(error, map: [400: EmailNotFound(), 404: EmailNotFound()])
        }
    }
}
