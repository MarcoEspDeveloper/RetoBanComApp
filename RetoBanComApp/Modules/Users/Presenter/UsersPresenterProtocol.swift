//
//  UsersPresenterProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol UsersPresenterProtocol {
    
    func getUsersList()
    func didGetUsersList(usersList: [UserResponse])
    func failGetUsersList(error: NSError)
    
    func getUserPostsList(userId: Int64)
    func didGetUserPostsList(usersList: [UserPostResponse])
    func failGetUserPostsList(error: NSError)
    func getUsers() -> [UserResponse]
}
