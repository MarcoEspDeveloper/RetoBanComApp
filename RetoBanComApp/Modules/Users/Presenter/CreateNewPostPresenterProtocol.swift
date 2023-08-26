//
//  CreateNewPostPresenterProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

protocol CreateNewPostPresenterProtocol {

    func createNewPost(userId: Int64, postTitle: String, postDescription: String)
    func didGetCreatePost(userPost: UserPostResponse)
    func failGetCreatePost(error: NSError)
    
    func goToBack()
}
