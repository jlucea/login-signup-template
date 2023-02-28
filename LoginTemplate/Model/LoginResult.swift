//
//  LoginResult.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

enum LoginResult {
    
    case success(UserInfo)
    case failure(Error)
    
}

struct UserInfo {
    
    let userId: String
    let email: String
    let username: String
    let fistName: String
    let lastNme : String
    
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String
    let refreshExpiresIn: Int
    
}
