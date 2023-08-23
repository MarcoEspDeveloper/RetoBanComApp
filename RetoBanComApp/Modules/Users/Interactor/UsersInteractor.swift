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
                
                self.presenter?.didGetMovieList(usersList: usersResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetUsersList(error: error)
            }
        }
    }
}
