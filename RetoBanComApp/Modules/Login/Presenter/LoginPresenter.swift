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
    
    init(view: LoginViewProtocol) {
        self.loginView = view
        self.interactor = LoginInteractor()
        self.router = LoginRouter(withView: self.loginView)
    }
    
    func goToValidateUser(userName: String, userPassword: String) {
        
        let isValidUser = self.interactor?.getUserValidation(userLoginInfo: UserRequest(userName: userName, userPassword: userPassword)) ?? false
        
        if isValidUser {
            self.router?.goToUsersList(originViewController: loginView as! LoginViewController)
        } else {
            
            loginView.showBasicAlert(title: "Error", message: "El usuario y/o la contraseña son incorrectos.")
        }
    }
}
