//
//  LoginService.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

class AuthenticationService : AuthenticationServiceProtocol {
    
    func login(credentials: UserCredentials, callback: @escaping (LoginResult) -> Void) {
        
        
        let userInfo = UserInfo(userId: "001", email: "user@mail.com", username: "johndoe", fistName: "John", lastNme: "Doe", accessToken: "XUIDHJEUOOUJ11DU", expiresIn: 1800, refreshToken: "DAJOS1387DJOJF5CB", refreshExpiresIn: 18000)
        
        callback(.success(userInfo))
        
        
    }
    
}
