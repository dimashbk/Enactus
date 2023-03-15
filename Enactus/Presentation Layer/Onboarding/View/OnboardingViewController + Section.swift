//
//  OnboardingViewController + Section.swift
//  Enactus
//
//  Created by Dinmukhamed on 15.03.2023.
//

import Foundation

extension OnboardingViewController {
    struct Section {
        enum Section {
            case onboarding
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
