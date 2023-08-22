//
//  LoginInteractorProtocol.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

protocol LoginInteractorProtocol {
    
    func getUserValidation(uaserLoginInfo: UserRequest) -> Bool
}
