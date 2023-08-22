//
//  ConnectionManagerProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol ConnectionManagerProtocol {
    
    func getUsersList(page: Int, handler: @escaping ([UserResponse]?, NSError?) -> Void)
}
