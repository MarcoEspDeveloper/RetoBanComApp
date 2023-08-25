//
//  CreateNewPostViewProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

protocol CreateNewPostViewProtocol: AnyObject {
    
    func showNewPostToBack(userPost: UserPostResponse)
    func showBasicAlert(title:String?, message: String?)
}
