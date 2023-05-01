//
//  ProfileCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 30.04.2023.
//

import UIKit

protocol WalletFlow: AnyObject {
    func showWalletFlow()
}

protocol NotificationFlow: AnyObject {
    func showNotificationFlow()
}

typealias ProfileCoordinatorProtocol = WalletFlow & NotificationFlow

final class ProfileCoordinator: BaseCoordinator{

    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = ProfileViewModel()
        let profileVC = ProfileViewController()
        profileVC.viewModel = viewModel
        profileVC.viewModel?.coordinatorDelegate = self
        navigationController.pushViewController(profileVC, animated: true)
    }
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {
    func showWalletFlow() {
        
    }
    
    func showNotificationFlow() {
        print("Move to Notification")
    }
    
    // MARK: - FlowMethods
    
    
}
