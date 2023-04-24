//
//  EmailResetCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 20.04.2023.
//

import UIKit


typealias EmailResetCoordinatorProtocol = OTPFlow

final class EmailResetCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let emailResetVC = EmailResetViewController()
        emailResetVC.viewModel = EmailResetViewModel()
        emailResetVC.viewModel?.coordinatorDelegate = self
        navigationController.pushViewController(emailResetVC, animated: true)
    }
}

extension EmailResetCoordinator: EmailResetCoordinatorProtocol {
    func showOTPFlow() {
        let otpCoordinator = OTPCoordinator(navigationController: navigationController)
        coordinate(to: otpCoordinator)
    }
    
    
}
