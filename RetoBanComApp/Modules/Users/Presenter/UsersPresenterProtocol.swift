//
//  UsersPresenterProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol UsersPresenterProtocol {
    
    func getUsersList()
    func didGetMovieList(usersList: [UserResponse])
    func failGetUsersList(error: NSError)
    func getUsers() -> [UserResponse]
}
