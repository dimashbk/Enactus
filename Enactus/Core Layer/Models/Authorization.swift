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
    let email: String?
}
// MARK: - SendCode
struct SendCodeResponse: Codable {
    let message: String
    let code: Code
}

// MARK: - Code
struct Code: Codable {
    let email, code, updatedAt, createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case email, code
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
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
// MARK: - ResetPassword
struct ResetPassword: Codable {
    let message: String
}
// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let message: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let email, updatedAt, createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case email
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}

//MARK: - UpdatedUser

struct UpdatedUser: Codable {
    let name, surname, patronymic, birthday, group: String
}
