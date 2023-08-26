//
//  LoginPresenter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 21/08/23.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var loginView: LoginViewProtocol!
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    var isEmailSave = false
    
    init(view: LoginViewProtocol) {
        self.loginView = view
        self.interactor = LoginInteractor()
        self.router = LoginRouter(withView: self.loginView)
    }
    
    func goToValidateUser(userName: String, userPassword: String) {
        
        let isValidUser = self.interactor?.getUserValidation(userLoginInfo: UserRequest(userName: userName, userPassword: userPassword)) ?? false
        
        if isValidUser {
            
            if isEmailSave {
                
                self.saveUserEmail(email: userName)
            } else {
                
                self.saveUserEmail(email: "")
            }
            
            self.router?.goToUsersList(originViewController: loginView as! LoginViewController)
        } else {
            
            loginView.showBasicAlert(title: "Error", message: "El usuario y/o la contraseña son incorrectos.")
        }
    }
    
    func saveUserEmail(email: String) {
        
        UserDefaults.standard.set(email, forKey: Constants.saveEmailKey)
    }
    
    func getSavedUserEmail() -> String {
        
        if let email = UserDefaults.standard.string(forKey: Constants.saveEmailKey) {
            
            return email
        }
        
        return ""
    }
    
    func setEmailSave() {
        
        self.isEmailSave = !self.isEmailSave
    }
    
    func setInitialSavedEmailStatus() {
        
        if getSavedUserEmail().count > 0 {
            
            self.isEmailSave = true
        } else {
            
            self.isEmailSave = false
        }
    }
    
    func getSavedEmailIndicatorStatus() -> Bool {
        
        return self.isEmailSave
    }
}
