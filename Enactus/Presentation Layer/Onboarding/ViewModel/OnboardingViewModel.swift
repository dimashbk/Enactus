//
//  OnboardingViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 15.03.2023.
//

import Foundation

import Foundation

protocol OnBoardingCollectionViewCellViewModelProtocol {
    var imageName: String { get }

}

struct OnBoardingCollectionViewCellViewModel: OnBoardingCollectionViewCellViewModelProtocol {
    
    typealias Row = OnboardingViewController.Section.Row
    
    //MARK: - Proprties
    
    let row: Row
    
    //MARK: - OnBoardingCollectionViewCellViewModelProtocol
    var imageName: String {
        switch row {
        case .first:
            return "backImage1"
        case .second:
            return "backImage2"
        }
    }
}
