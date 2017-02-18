//
//  AuthorizationManager.swift
//  SwiftLesson2
//
//  Created by Никита Солдатов on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation


enum AuthorisationStatus {
    case authorized
    case notAuthorized
    
    init(value : Bool) {
        if (value)
        {
            self = AuthorisationStatus.authorized
        }else {
            self = AuthorisationStatus.notAuthorized
        }
    }
    
    func boolValue() -> Bool {
        switch self {
        case .authorized:
            return true
        case .notAuthorized:
            return false
        }
    }
}

final class AuthorizationManager {
    
    static let sharedInstance = AuthorizationManager()
    private let authorisationKey = "authorisation"
    
    func login(with name: String , and password: String) -> AuthorisationStatus {
        if validate(name: name, password: password) {
            UserDefaults.standard.set(AuthorisationStatus.authorized.boolValue(), forKey: authorisationKey)
            return AuthorisationStatus.authorized
        }else {
            return AuthorisationStatus.notAuthorized
        }
    }
    
    func signOut() {
        UserDefaults.standard.set(AuthorisationStatus.notAuthorized.boolValue(), forKey: authorisationKey)
    }
    
    func isAuthorized() -> AuthorisationStatus {
        guard let isAuthorised : Bool = UserDefaults.standard.value(forKey: authorisationKey) as? Bool else {
            return AuthorisationStatus.notAuthorized
        }
        return AuthorisationStatus.init(value: isAuthorised)
    }

}

private extension AuthorizationManager {
    
    func validate(name: String, password: String) -> Bool {
        let loginFormat = "^[-\\w.]+@([A-z0-9][-A-z0-9]+\\.)+[A-z]{2,4}$"
        let loginPredicate = NSPredicate(format:"SELF MATCHES %@", loginFormat)
        
        let passwordFormat = "(?=^.{6,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.+[a-z]).*$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        
        let loginResult:Bool = loginPredicate.evaluate(with: name)
        let passwordResult:Bool = passwordPredicate.evaluate(with: password)
        
        
        let testResult = loginResult && passwordResult
        return testResult

    }
}
