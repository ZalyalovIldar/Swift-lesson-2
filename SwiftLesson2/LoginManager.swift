//
//  LoginManager.swift
//  SwiftLesson2
//
//  Created by Наталья on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

class LoginManager {
    static let sharedInstance = LoginManager()
    
    private let loginStatusKey = "loginStatus"
    
    func login(login:String, password:String) -> Bool {
        
       let isRegistred = isValitedLoginData(login: login, password: password)
        if isRegistred {
            UserDefaults.standard.set(isRegistred, forKey: loginStatusKey)
        }
        return isRegistred
        
    }
    
    func logOut() {
        UserDefaults.standard.set(false, forKey: loginStatusKey)
    }
    
    func loginStatus() -> Bool {
        guard let status:Bool = UserDefaults.standard.value(forKey: loginStatusKey) as! Bool? else{
            return false
        }
        return status
    }
    
    
}


private extension LoginManager {
    
     func isValitedLoginData(login:String, password:String) -> Bool {
        let loginFormat = "^[-\\w.]+@([A-z0-9][-A-z0-9]+\\.)+[A-z]{2,4}$"
        let loginTest = NSPredicate(format:"SELF MATCHES %@", loginFormat)
        
        let passwordFormat: String = "(?=^.{6,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.+[a-z]).*$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        
        let loginResult:Bool = loginTest.evaluate(with: login)
        let passwordResult:Bool = passwordTest.evaluate(with: password)
        
    
        let testResult = loginResult && passwordResult
        return testResult
        
    }
}
    
  

