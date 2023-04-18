//
//  OTPCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 03.04.2023.
//

import UIKit

final class OTPCoordinator: Coordinator {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let otpVC = OTPViewController()
        otpVC.coordinator = self
        navigationController.pushViewController(otpVC, animated: true)
    }
}
