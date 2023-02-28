//
//  SignupViewModelProtocol.swift
//  LoginTemplate
//
//  Created by Jaime Lucea on 28/2/23.
//

import Foundation

protocol SignupServiceProtocol {
    
    func registerUser(signupData: SignupData, callback: @escaping (LoginResult) -> Void)
    
}
