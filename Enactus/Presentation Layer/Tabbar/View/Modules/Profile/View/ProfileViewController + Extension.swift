//
//  ProfileViewController + Extension.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

extension ProfileViewController {
    struct Profile {
        enum Section {
            case info
            case button
        }
        
        enum Row {
            case first
            case second
            case third
        }
        
        let section: Section
        var rows: [Row]
    }
}
