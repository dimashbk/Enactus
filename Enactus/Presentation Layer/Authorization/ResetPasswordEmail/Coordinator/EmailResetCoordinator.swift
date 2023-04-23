//
//  EmailResetCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 20.04.2023.
//

import UIKit

final class EmailResetCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let emailResetVC = EmailResetViewController()
        emailResetVC.coordinator = self
        navigationController.pushViewController(emailResetVC, animated: true)
    }
}
