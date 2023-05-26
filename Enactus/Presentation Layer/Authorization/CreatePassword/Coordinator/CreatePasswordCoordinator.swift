//
//  CreatePasswordCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 19.04.2023.
//

import UIKit

protocol RootFlow {
    func showRootFlow()
}

typealias CreatePasswordCoordinatorProtocol = SigninFlow & RootFlow

final class CreatePasswordCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let createPasswordVC = CreatePasswordViewController()
        createPasswordVC.viewModel = CreatePasswordViewModel()
        createPasswordVC.viewModel?.coordinatorDelegate = self
        navigationController.pushViewController(createPasswordVC, animated: true)
    }
}

extension CreatePasswordCoordinator: CreatePasswordCoordinatorProtocol {
    func showAlert() {
        let alert = CustomAlertController(alertTitle: "Вы успешно зарегистрированы!", alertIconString: "alertgood")
        navigationController.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController.dismiss(animated: true)
            self.showSigninFlow()
        }
    }
    
    func showRootFlow() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func showSigninFlow() {
        let signinCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signinCoordinator)
    }
    
    
    
}
