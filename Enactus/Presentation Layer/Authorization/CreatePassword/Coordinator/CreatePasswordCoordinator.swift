//
//  CreatePasswordCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 19.04.2023.
//

import Foundation

import UIKit

final class CreatePasswordCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let createPasswordVC = CreatePasswordViewController()
        createPasswordVC.coordinator = self
        navigationController.pushViewController(createPasswordVC, animated: true)
    }
}
