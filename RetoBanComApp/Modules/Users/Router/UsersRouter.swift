//
//  UsersRouter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class UsersRouter {
    
    private weak var usersViewProtocol: UsersViewProtocol!
    
    init(withView view: UsersViewProtocol) {
        self.usersViewProtocol = view
    }
}

extension UsersRouter: UsersRouterProtocol {
    
    
}
