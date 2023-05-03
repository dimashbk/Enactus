//
//  ProfileViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

final class ProfileViewModel {
    
    var coordinatorDelegate: ProfileCoordinatorProtocol?
    
    var networkService = ENNetworkService()

    
    func moveToNotification() {
        coordinatorDelegate?.showNotificationFlow()
    }
    
    func moveToWallet() {
        coordinatorDelegate?.showWalletFlow()
    }
    
    func moveToEdit() {
        coordinatorDelegate?.showEditFlow()
    }

}
