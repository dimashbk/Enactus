//
//  SigninViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 21.04.2023.
//

import Foundation

final class SigninViewModel {
    
    var coordinatorDelegate: SigninCoordinatorProtocol?
    
    var statusText = Dynamic("")
    
    
    func signIn(email: String, password: String) {
        AuthorizationService.shared.authorizationModel.email = email
        AuthorizationService.shared.authorizationModel.password = password
        self.coordinatorDelegate?.showOTPFlow()
    }
    
    func moveToOTP() {
        self.coordinatorDelegate?.showOTPFlow()
    }
    func moveToLogin() {
        coordinatorDelegate?.showLoginFlow()
    }
    
}
