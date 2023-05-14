//
//  Authorization Service.swift
//  Enactus
//
//  Created by Dinmukhamed on 23.04.2023.
//

import Foundation

enum AuthorizationPath {
    case signIn
    case signUp
    case resetPassword
    case none
}

import Foundation

// MARK: - Retake
struct Retake: Codable {
    let retakes: [RetakeElement]
}

// MARK: - RetakeElement
struct RetakeElement: Codable {
    let id, userID: Int
    let title: String
    let paymentAmount: Int
    let status: Int
    let expirationDate: String
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title
        case expirationDate = "expiration_date"
        case status
        case paymentAmount = "payment_amount"
        
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

final class AuthorizationService {
    
    static let shared = AuthorizationService()
    
    let networkService = ENNetworkService()
    
    var authorizationPath: AuthorizationPath = .none
    
    var accessToken: String {
        get{
            if UserDefaults.standard.value(forKey: "accessToken") == nil {
                return ""
            } else {
                return  UserDefaults.standard.value(forKey: "accessToken") as! String
            }
        
        }
        set{
                UserDefaults.standard.set(newValue, forKey: "accessToken")
                self.getRetakes()
        }
    }
    
    var correctCode = String()
    
    var authorizationModel = Authorization(email: nil,
                                           code: nil,
                                           password: nil)
    
    func login() {
        networkService.postLogin(param: authorizationModel) { [weak self] result in
            self?.accessToken = result?.token.original.accessToken ?? ""
            self?.getProfileInfo()
            print(self?.accessToken)

        }
    }
    
    func sendCode() {
        networkService.sendCode(param: authorizationModel.email) { [weak self] result in
            self?.correctCode = result?.code.code ?? ""
            print(self?.correctCode)
        }
    }
    func resetPassword() {
        networkService.resetPassword(param: authorizationModel) { [weak self] result in

        }
    }
    func register() {
        networkService.postRegister(param: authorizationModel) { [weak self] result in
            
        }
    }
    func refreshToken() {

        guard let url = URL(string: "http://studc-api.kz/api/auth/refresh-token") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<Login,Error>) in
            switch result {
            case .success(let data):
                self.accessToken = data.token.original.accessToken
                print(self.accessToken)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    func getProfileInfo() {
        guard let url = URL(string: "http://studc-api.kz/api/auth/profile/get") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<Profile,Error>) in
            switch result {
            case .success(let data):
                profileInfo = data
                print(profileInfo)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    func getRetakes() {
        guard let url = URL(string: "http://studc-api.kz/api/retakes") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<Retake,Error>) in
            switch result {
            case .success(let data):
                print(data.retakes)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
