//
//  UserResponse.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation

struct UserResponse: Decodable {
    
    var id: Int64?
    var name: String?
    var username: String?
    var email: String?
    var address: AddressUserResponse?
    var phone: String?
    var website: String?
    var company: CompanyUserResponse?
    var userPosts: [UserPostResponse]?
}

struct GeoUserResponse: Decodable {
    
    var lat: String?
    var lng: String?
}

struct AddressUserResponse: Decodable {
    
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: GeoUserResponse?
}

struct CompanyUserResponse: Decodable {
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
}
