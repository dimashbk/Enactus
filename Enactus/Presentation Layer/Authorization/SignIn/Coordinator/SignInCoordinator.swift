//
//  SignInCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import UIKit

final class SignInCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let signInVC =  SignInViewController()
        signInVC.coordinator = self
//        signInVC.navigationItem.hidesBackButton = true
        navigationController.pushViewController(signInVC, animated: true)
    }
}
