//
//  UserPostRequest.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

struct UserPostRequest: Codable {
    
    var title: String?
    var body: String?
    var userId: Int64?
}
