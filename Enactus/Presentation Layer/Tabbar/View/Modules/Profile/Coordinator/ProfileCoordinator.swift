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

protocol EditFlow: AnyObject {
    func showEditFlow()
}

typealias ProfileCoordinatorProtocol = WalletFlow & NotificationFlow & EditFlow

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
    func showEditFlow() {
        let editCoordinator = EditCoordinator(navigationController: navigationController)
        coordinate(to: editCoordinator)
    }
    
    func showWalletFlow() {
        let walletCoordinator = WalletCoordinator(navigationController: navigationController)
        coordinate(to: walletCoordinator)
    }
    
    func showNotificationFlow() {
        let notificationCoordinator = NotificationCoordinator(navigationController: navigationController)
        coordinate(to: notificationCoordinator)
    }
    
    // MARK: - FlowMethods
    
    
}
