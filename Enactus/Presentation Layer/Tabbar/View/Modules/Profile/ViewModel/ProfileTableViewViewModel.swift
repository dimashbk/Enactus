//
//  ProfileTableViewViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

protocol ProfileInfoTableViewCellViewModelProtocol {
    var cellName: String { get }
    var cellInfo: String { get }
    
}

final class ProfileInfoTableViewCellViewModel: ProfileInfoTableViewCellViewModelProtocol {
    
    typealias Row = ProfileViewController.Profile.Row
    var row: Row
    let storage = UserDefaults.standard
    
    init(row: Row) {
        self.row = row
    }

    var networkService = ENNetworkService()
    
    var cellName: String {
        switch row {
        case .first:
            return "Дата Рождения"
        case .second:
            return "Группа"
        case .third:
            return "ID"
        }
    }
    
    var cellInfo: String {
        switch row {
        case .first:
            return profileInfo.birthday ?? ""
        case .second:
            return profileInfo.group ?? ""
        case .third:
            return String(profileInfo.id)
            
        }
    }
}
