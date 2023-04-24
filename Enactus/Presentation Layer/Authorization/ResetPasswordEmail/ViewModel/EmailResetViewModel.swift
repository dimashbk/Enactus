//
//  EmailResetViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 24.04.2023.
//

import Foundation

final class EmailResetViewModel {
    
    var coordinatorDelegate: EmailResetCoordinatorProtocol?
    
    func moveToOTP(email: String) {
        AuthorizationService.shared.authorizationModel.email = email
        coordinatorDelegate?.showOTPFlow()
    }
    
}
