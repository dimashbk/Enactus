//
//  Coordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation

import Foundation
import UIKit

class LogInCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let logInVC =  LogInViewController()
        logInVC.delegate = self
        navigationController.pushViewController(logInVC, animated: true)
    }
}
