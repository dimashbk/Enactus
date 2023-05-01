//
//  ProfileButtonTableViewCellViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

protocol ProfileButtonTableViewCellViewModelProtocol {
    var cellName: String { get }    
}
struct ProfileButtonTableViewCellViewModel: ProfileButtonTableViewCellViewModelProtocol {
    
    typealias Row = ProfileViewController.Profile.Row
    
    var row: Row
    
    var cellName: String {
        switch row {
        case .first:
            return "Кошелек"
        case .second:
            return "Уведомления"
        case .third:
            return "Выйти"
        }
    }
}
