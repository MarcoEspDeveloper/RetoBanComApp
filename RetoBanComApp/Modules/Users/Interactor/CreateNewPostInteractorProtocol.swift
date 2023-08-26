//
//  CreateNewPostInteractorProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

protocol CreateNewPostInteractorProtocol {
    
    func postCreateNewPost(userId: Int64, postTitle: String, postDescription: String)
}
