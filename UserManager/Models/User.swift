//
//  UserApi.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var address: Address
}

struct Address: Codable {
    var city: String
    var latitude: Double?
    var longitude: Double?
}

