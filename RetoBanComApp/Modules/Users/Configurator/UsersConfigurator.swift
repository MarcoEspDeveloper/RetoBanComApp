//
//  UsersConfigurator.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class UsersConfigurator: UsersConfiguratorProtocol {
    
    func configure(viewController: UsersViewController, delegate: UsersViewDelegate) {
        
        viewController.presenter = UsersPresenter(view: viewController, delegate: delegate)
    }
}
