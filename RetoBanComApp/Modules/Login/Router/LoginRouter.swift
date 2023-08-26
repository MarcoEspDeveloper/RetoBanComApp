//
//  LoginRouter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    private weak var loginViewProtocol: LoginViewProtocol!
    
    init(withView view: LoginViewProtocol) {
        self.loginViewProtocol = view
    }
    
    func goToUsersList(originViewController: LoginViewController) {
        
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        let destinyViewController = storyboard.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        let navController = UINavigationController(rootViewController: destinyViewController)
        navController.modalPresentationStyle = .fullScreen
        
        originViewController.present(navController, animated: true, completion: nil)
    }
}
