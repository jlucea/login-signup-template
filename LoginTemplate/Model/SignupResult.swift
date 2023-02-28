//
//  SignupResult.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

enum SignupResult {
    
    case success(LoginResult)
    case failure(Error)
    
}
