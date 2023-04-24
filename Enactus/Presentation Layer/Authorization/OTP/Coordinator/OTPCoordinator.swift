//
//  OTPCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 03.04.2023.
//

import UIKit

protocol CreatePasswordFlow {
    func showCreatePasswordFlow()
}
protocol TabBarFlow {
    func showTabBarFlow()
}

typealias OTPCoordinatorProtocol = CreatePasswordFlow & TabBarFlow

final class OTPCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let otpVC = OTPViewController()
        otpVC.viewModel = OTPViewModel()
        otpVC.viewModel?.coordinatorDelegate = self
        navigationController.pushViewController(otpVC, animated: true)
    }
}
extension OTPCoordinator: OTPCoordinatorProtocol {
    func showTabBarFlow() {
        let tabbarCoordinator = ENTabBarCoordinator(navigationController: navigationController)
    }
    
    func showCreatePasswordFlow() {
        let createPasswordCoordinator = CreatePasswordCoordinator(navigationController: navigationController)
        coordinate(to: createPasswordCoordinator)
    }
    
    
    
}
