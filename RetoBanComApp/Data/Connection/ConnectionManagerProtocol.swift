//
//  ConnectionManagerProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol ConnectionManagerProtocol {
    
    func getUsersList(handler: @escaping ([UserResponse]?, NSError?) -> Void)
    func getUserPostsList(userId: Int64, handler: @escaping ([UserPostResponse]?, NSError?) -> Void)
    func postCreateUserPost(userId: Int64, postTitle: String, postDescription: String, handler: @escaping (UserPostResponse?, NSError?) -> Void)
}
