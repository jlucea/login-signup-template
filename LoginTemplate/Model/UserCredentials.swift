//
//  UserCredentials.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

struct UserCredentials: Codable {
    
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}

