//
//  SignInCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import UIKit

protocol LoginFlow: AnyObject {
    func showLoginFlow()
}
protocol EmailResetFlow: AnyObject {
    func showEmailResetFlow()
}

typealias SigninCoordinatorProtocol = OTPFlow & LoginFlow & EmailResetFlow

final class SignInCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let signInVC =  SignInViewController()
        signInVC.viewModel = SigninViewModel()
        signInVC.viewModel?.coordinatorDelegate = self
        signInVC.navigationItem.hidesBackButton = true
        signInVC.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(signInVC, animated: true)
    }
}

extension SignInCoordinator: SigninCoordinatorProtocol{
    func showEmailResetFlow() {
        let emailResetCoordinator = EmailResetCoordinator(navigationController: navigationController)
        coordinate(to: emailResetCoordinator)
    }
    
    func showOTPFlow() {
        let otpCoordinator = OTPCoordinator(navigationController: navigationController)
        coordinate(to: otpCoordinator)
    }
    
    func showLoginFlow() {
        let signinCoordinator = LogInCoordinator(navigationController: navigationController)
        coordinate(to: signinCoordinator)
    }
    
    
}
