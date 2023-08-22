//
//  LoginInteractor.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    func getUserValidation(userLoginInfo: UserRequest) -> Bool {
        
        let userData = UserData()
        
        if userLoginInfo.userName != userData.email {
            
            return false
        }
        
        if userLoginInfo.userPassword != userData.passwrd {
            
            return false
        }
        
        return true
    }
}
