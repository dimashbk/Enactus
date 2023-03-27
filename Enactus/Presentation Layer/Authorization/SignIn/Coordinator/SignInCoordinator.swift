//
//  SignInCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation
import UIKit

class SignInCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signInVC =  SignInViewController()
        signInVC.delegate = self
        navigationController.pushViewController(signInVC, animated: true)
    }
}
