//
//  EditViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 02.05.2023.
//

import Foundation

var profileInfo: Profile {
    get{
        if let data = UserDefaults.standard.value(forKey: "ProfileInfo") as? Data{
            return try! PropertyListDecoder().decode(Profile.self, from: data)
        }
        else{
            return .init(id: 0, name: "", surname: "", patronymic: "", birthday: "", group: "", walletAddress: "", amount: 0)
        }
    }
    set{
        if let data = try? PropertyListEncoder().encode(newValue)
        {
            UserDefaults.standard.set(data, forKey: "ProfileInfo")
        }
    }
}

final class EditProfileViewModel {
    
    let networkService = ENNetworkService()
    
    func updateInfo(name: String?,
                    surname: String?,
                    patronymic: String?,
                    birthday: String?,
                    group: String?) {
        
        guard let url = URL(string: "http://studc-api.kz/api/auth/profile/update") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        var patchBody = ProfilePatch(name: (name ?? profileInfo.name)!,
                                     surname: surname ?? profileInfo.surname,
                                     patronymic: patronymic ?? profileInfo.patronymic,
                                     birthday: birthday ?? profileInfo.birthday,
                                     group: group ?? profileInfo.group)
        
        profileInfo.birthday = patchBody.birthday
        profileInfo.name = patchBody.name
        profileInfo.surname = patchBody.surname
        profileInfo.group = patchBody.group
        
        do {
            let encoder = JSONEncoder()
            let body = try encoder.encode(patchBody)
            
            networkService.sendRequest(url: url, method: "PATCH", headers: headers, body: body) { (result: Result<ResetPassword,Error>) in
                switch result {
                case .success(let data):
                    print("Response: \(data)")
                    AuthorizationService.shared.getProfileInfo()
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        } catch {
            print("error")
        }
        
    }
}
