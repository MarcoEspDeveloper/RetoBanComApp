//
//  CreateNewPostPresenter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

class CreateNewPostPresenter: CreateNewPostPresenterProtocol {
    
    weak var usersView: CreateNewPostViewProtocol!
    var interactor: CreateNewPostInteractorProtocol?
    var router: CreateNewPostRouterProtocol?
    
    var usersList: [UserResponse] = []
    
    init(view: CreateNewPostViewProtocol) {
        self.usersView = view
        self.interactor = CreateNewPostInteractor(presenter: self)
        self.router = CreateNewPostRouter(withView: self.usersView)
    }
}
