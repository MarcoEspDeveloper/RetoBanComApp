//
//  UsersViewProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol UsersViewProtocol: AnyObject {
    
    func showBasicAlert(title:String?, message: String?)
    func showUsersList()
    func showUserPosts(userId: Int64)
}
