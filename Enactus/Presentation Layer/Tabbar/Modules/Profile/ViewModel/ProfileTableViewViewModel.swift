//
//  ProfileTableViewViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

protocol ProfileInfoTableViewCellViewModelProtocol {
    var cellName: String { get }
    var cellInfo: String { get }
    
}
struct ProfileInfoTableViewCellViewModel: ProfileInfoTableViewCellViewModelProtocol {
    
    typealias Row = ProfileViewController.Profile.Row
    var row: Row
    
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
            return "28.09.2022"
        case .second:
            return "ITIS-1916R"
        case .third:
            return "282828"
        }
    }
}
