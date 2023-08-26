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
    var isExpanded: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case address
        case phone
        case website
        case company
        case userPosts
        case isExpanded
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int64.self, forKey: .id)!
        self.name = try values.decodeIfPresent(String.self, forKey: .name)!
        self.username = try values.decodeIfPresent(String.self, forKey: .username)!
        self.email = try values.decodeIfPresent(String.self, forKey: .email)!
        self.address = try values.decodeIfPresent(AddressUserResponse.self, forKey: .address)!
        self.phone = try values.decodeIfPresent(String.self, forKey: .phone)!
        self.website = try values.decodeIfPresent(String.self, forKey: .website)!
        self.company = try values.decodeIfPresent(CompanyUserResponse.self, forKey: .company)!
        self.userPosts = []
        self.isExpanded = false
    }
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
