//
//  UsersConfigurator.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class UsersConfigurator: UsersConfiguratorProtocol {
    
    func configure(viewController: UsersViewController) {
        
        viewController.presenter = UsersPresenter(view: viewController)
    }
}