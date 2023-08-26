//
//  UsersInteractor.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

class UsersInteractor: UsersInteractorProtocol {
    
    var connectionManager: ConnectionManagerProtocol?
    
    var presenter: UsersPresenterProtocol?
    
    init(presenter: UsersPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func getUsersList() {
        
        connectionManager = ConnectionManager()
        
        connectionManager?.getUsersList() { (response, error) in
            
            if let usersResponse = response {
                
                self.presenter?.didGetUsersList(usersList: usersResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetUsersList(error: error)
            }
        }
    }
    
    func getUserPostsList(userId: Int64) {
        
        connectionManager = ConnectionManager()
        
        connectionManager?.getUserPostsList(userId: userId) { (response, error) in
            
            if let userPostsResponse = response {
                
                self.presenter?.didGetUserPostsList(userPostsList: userPostsResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetUserPostsList(error: error)
            }
        }
    }
}
