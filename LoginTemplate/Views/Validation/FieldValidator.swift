//
//  Validator.swift
//  TravelPartnerApp
//
//  Created by Jaime Lucea on 20/2/23.
//

import Foundation

struct FieldValidator {
    
    public static let EMAIL_FORMAT_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public static let PASSWORD_FORMAT_REGEX = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*¡_?¿&])[A-Za-z\\d@$!¡%*¿?_&]{8,}"
    
    public static func isValidEmail(_ email: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", EMAIL_FORMAT_REGEX)
        return emailPred.evaluate(with: email)
    }
    
    public static func isSecurePassword(_ password: String) -> Bool {
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", PASSWORD_FORMAT_REGEX)
        return passwordPred.evaluate(with: password)
    }
    
}

