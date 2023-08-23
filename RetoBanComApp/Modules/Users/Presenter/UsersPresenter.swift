//
//  UsersPresenter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class UsersPresenter: UsersPresenterProtocol {
    
    weak var usersView: UsersViewProtocol!
    var interactor: UsersInteractorProtocol?
    var router: UsersRouterProtocol?
    
    var usersList: [UserResponse] = []
    
    init(view: UsersViewProtocol) {
        self.usersView = view
        self.interactor = UsersInteractor(presenter: self)
        self.router = UsersRouter(withView: self.usersView)
    }
    
    func getUsersList() {
        
        self.interactor?.getUsersList()
    }
    
    func didGetMovieList(usersList: [UserResponse]) {
        
        self.usersList.append(contentsOf: usersList)
        self.usersView.showUsersList()
    }
    
    func failGetUsersList(error: NSError) {
        
        self.usersList.removeAll()
        
        self.usersView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func getUsers() -> [UserResponse] {
        
        return self.usersList
    }
}
