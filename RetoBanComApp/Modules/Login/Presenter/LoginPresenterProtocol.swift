//
//  LoginPresenterProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 21/08/23.
//

import Foundation

protocol LoginPresenterProtocol {
    
    func goToValidateUser(userName: String, userPassword: String)
    func saveUserEmail(email: String)
    func getSavedUserEmail() -> String
    func setEmailSave()
    func setInitialSavedEmailStatus()
    func getSavedEmailIndicatorStatus() -> Bool
}
