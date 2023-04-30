//
//  OTPViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 24.04.2023.
//

final class OTPViewModel {
    
    var coordinatorDelegate: OTPCoordinatorProtocol?
    
    var statusText = Dynamic("")
    
    func nextStep() {
        if AuthorizationService.shared.correctCode == AuthorizationService.shared.authorizationModel.code {
            checkPath()
        } else {
            statusText.value = "Введеный код неверен. Попробуйте еще раз."
        }
    }
    
    private func checkPath() {
        switch AuthorizationService.shared.authorizationPath {
        case .resetPassword:
            print("Reset Password")
            AuthorizationService.shared.resetPassword()
            coordinatorDelegate?.showCreatePasswordFlow()
        case .signIn:
            print("Sign In")
            AuthorizationService.shared.login()
            coordinatorDelegate?.showTabBarFlow()
        case .signUp:
            print("Sign Up")
            AuthorizationService.shared.register()
            coordinatorDelegate?.showCreatePasswordFlow()
        case .none:
            print("none")
        }
    }
    
}
