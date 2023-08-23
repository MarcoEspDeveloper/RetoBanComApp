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
    
    func getUserPostsList(userId: Int64) {
        
        self.interactor?.getUserPostsList(userId: userId)
    }
    
    func didGetUsersList(usersList: [UserResponse]) {
        
        self.usersList.append(contentsOf: usersList)
        self.usersView.showUsersList()
    }
    
    func failGetUsersList(error: NSError) {
        
        self.usersView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func didGetUserPostsList(usersList: [UserPostResponse]) {
        
        if let userId = usersList.first?.userId {
            
            if let index = self.usersList.firstIndex(where: { $0.id == userId }) {
                
                self.usersList[index].userPosts = usersList
                
                print("CANTIDAD DE POSTS DEL USUARIO \((self.usersList[index].name)!): \(self.usersList[index].userPosts?.count ?? 0)")
            }
        }
    }
    
    func failGetUserPostsList(error: NSError) {
        
        self.usersView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func getUsers() -> [UserResponse] {
        
        return self.usersList
    }
}
