//
//  Authorization.swift
//  Enactus
//
//  Created by Dinmukhamed on 23.04.2023.
//

import Foundation

// MARK: - Authorization
struct Authorization: Codable {
    var email, code, password: String?
}
// MARK: - SendCode
struct SendCode: Codable {
    let email: String
}
struct Login: Codable {
    let message: String
    let token: Token
}

// MARK: - Token
struct Token: Codable {
    let headers: Headers
    let original: Original
}

// MARK: - Headers
struct Headers: Codable {
}

// MARK: - Original
struct Original: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
