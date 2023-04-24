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
        AuthorizationService.shared.sendCode()
        self.coordinatorDelegate?.showOTPFlow()
    }
    
    func forgotPassword() {
        self.coordinatorDelegate?.showEmailResetFlow()
    }
    
    func moveToOTP() {
        self.coordinatorDelegate?.showOTPFlow()
    }
    
    func moveToLogin() {
        coordinatorDelegate?.showLoginFlow()
    }
    
}
