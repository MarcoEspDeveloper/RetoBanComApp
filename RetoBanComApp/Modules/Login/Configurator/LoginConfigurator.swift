//
//  LoginConfigurator.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController) {
        
        viewController.presenter = LoginPresenter(view: viewController)
    }
}
