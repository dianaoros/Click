//
//  Password.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

struct NewPassword: Encodable {
    let email: String
    let newPassword: String
    let otpCode: String
}

struct PasswordRecovery: Encodable {
    let email: String
}

struct PasswordRecoveryVerify: Encodable {
    let email: String
    let otpCode: String
}
