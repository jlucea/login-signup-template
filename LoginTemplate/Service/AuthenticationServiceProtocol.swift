//
//  LoginServiceProtocol.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

protocol AuthenticationServiceProtocol {
    
    func login(credentials: UserCredentials, callback: @escaping (LoginResult) -> Void)
    
}

