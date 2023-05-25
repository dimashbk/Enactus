//
//  Coordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import UIKit

protocol OTPFlow: AnyObject {
    func showOTPFlow()
}

protocol SigninFlow: AnyObject {
    func showSigninFlow()
    func showAlert()
}

typealias LoginCoordinatorProtocol = OTPFlow & SigninFlow

final class LogInCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = LoginViewModel()
        let logInVC = LogInViewController()
        logInVC.viewModel = viewModel
        logInVC.viewModel?.coordinatorDelegate = self
        navigationController.pushViewController(logInVC, animated: true)
    }
}

extension LogInCoordinator: LoginCoordinatorProtocol {
    // MARK: - FlowMethods
    func showOTPFlow() {
        let otpCoordinator = OTPCoordinator(navigationController: navigationController)
        coordinate(to: otpCoordinator)
    }
    func showSigninFlow() {
        let signinCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signinCoordinator)
    }
    
    func showAlert() {
        let alert = CustomAlertController(alertTitle: "Вы успешно зарегистрированы!", alertIconString: "alertgood")
        alert.view.backgroundColor = .enDark
        navigationController.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showSigninFlow()
        }
    }
}
