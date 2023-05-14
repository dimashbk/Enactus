//
//  ProfileModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
    var id: Int
    var name, surname, patronymic, birthday: String
    var group: String
    var walletAddress: String
    var amount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, surname, patronymic, birthday, group
        case amount = "payment_amount"
        case walletAddress = "wallet_address"
    }
}
// MARK: - Profile Patch
struct ProfilePatch: Codable {
    let name, surname, patronymic, birthday: String
    let group: String
}

