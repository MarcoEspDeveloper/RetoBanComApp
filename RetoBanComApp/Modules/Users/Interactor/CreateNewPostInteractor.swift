//
//  CreateNewPostInteractor.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

class CreateNewPostInteractor: CreateNewPostInteractorProtocol {
    
    var connectionManager: ConnectionManagerProtocol?
    
    var presenter: CreateNewPostPresenterProtocol?
    
    init(presenter: CreateNewPostPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func postCreateNewPost(userId: Int64, postTitle: String, postDescription: String) {
        
        connectionManager = ConnectionManager()
        
        connectionManager?.postCreateUserPost(userId: userId, postTitle: postTitle, postDescription: postDescription) { (response, error) in
            
            if let postResponse = response {
                
                // Llamar al presenter en caso de éxito
            }
            
            if let error = error {
                
                // LLamar al presenter en caso de error
            }
        }
    }
}
