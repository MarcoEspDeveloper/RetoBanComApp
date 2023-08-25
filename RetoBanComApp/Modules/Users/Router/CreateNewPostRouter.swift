//
//  CreateNewPostRouter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

class CreateNewPostRouter {
    
    private weak var createNewPostViewProtocol: CreateNewPostViewProtocol!
    
    init(withView view: CreateNewPostViewProtocol) {
        self.createNewPostViewProtocol = view
    }
}

extension CreateNewPostRouter: CreateNewPostRouterProtocol {
    
    
}
