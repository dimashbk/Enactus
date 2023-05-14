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
    
    func moveToWallet() {
        coordinatorDelegate?.showWalletFlow()
    }
    
    func moveToEdit() {
        coordinatorDelegate?.showEditFlow()
    }
    func signOut() {
        coordinatorDelegate?.showSigninFlow()
        AuthorizationService.shared.accessToken = ""
        profileInfo = Profile(id: 0,
                              name: "",
                              surname: "",
                              patronymic: "",
                              birthday: "",
                              group: "",
                              walletAddress: "", amount: 0)
    }

}
