//
//  ProfileModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
    let name, surname, patronymic, birthday: String
    let group: String
}
