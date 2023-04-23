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

typealias LoginCoordinatorProtocol = OTPFlow

final class LogInCoordinator: BaseCoordinator, LoginCoordinatorProtocol{

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let logInVC =  LogInViewController()
        logInVC.coordinator = self
        navigationController.pushViewController(logInVC, animated: true)
    }
    
    // MARK: - FlowMethods
    func showOTPFlow() {
        let otpCoordinator = OTPCoordinator(navigationController: navigationController)
        coordinate(to: otpCoordinator)
    }
    
}
