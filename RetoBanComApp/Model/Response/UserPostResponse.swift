//
//  UserPostRequest.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 23/08/23.
//

import Foundation

struct UserPostResponse: Decodable {
    
    var userId: Int64?
    var id: Int64?
    var title: String?
    var body: String?
}
