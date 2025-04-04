//
//  ValidationService.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation

class ValidationService {
    static func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}

