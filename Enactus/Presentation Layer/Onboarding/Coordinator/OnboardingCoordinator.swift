//
//  OnboardingCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation
import UIKit

class OnboardingCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.delegate = self
        navigationController.pushViewController(onboardingVC, animated: true)
    }
    
    // MARK: - FlowMethods
    func showLogInFlow() {
        let logInCoordinator = LogInCoordinator(navigationController: navigationController)
        coordinate(to: logInCoordinator)
    }
    
    func showSignInFlow() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }
}
