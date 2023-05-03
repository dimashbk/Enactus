//
//  ProfileModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
    let id: Int
    let name, surname, patronymic, birthday: String?
    let group: String?
    let walletAddress: String

    enum CodingKeys: String, CodingKey {
        case id, name, surname, patronymic, birthday, group
        case walletAddress = "wallet_address"
    }
}
// MARK: - Profile Patch
struct ProfilePatch: Codable {
    let name, surname, patronymic, birthday: String
    let group: String
}

