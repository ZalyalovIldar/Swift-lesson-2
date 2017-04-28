//
//  LoginManager.swift
//  SwiftLesson2
//
//  Created by Gulia_Is on 26.04.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

class LoginManager {
    
    private let loginStatusKey = "loginStatus"
    
    func login(login:String, password:String) -> Bool {
        
        let isRegistred = isValidationSuccessful(email: login, password: password)
         if isRegistred {
            UserDefaults.standard.set(isRegistred, forKey: loginStatusKey)
        }
        return isRegistred
        
    }
    
    func logOut() {
        
        UserDefaults.standard.synchronize()
        UserDefaults.standard.set(false, forKey: loginStatusKey)
        
    }
    
    func loginStatus() -> Bool {
        
        UserDefaults.standard.synchronize()
        if let _ = UserDefaults.standard.value(forKey: loginStatusKey) as! Bool?
        {
            return true
        }else{
            return false
        }
        
    }

    func isValidationSuccessful(email:String, password:String) -> Bool {
        
        let emailRegex:String = "^[-\\w.]+@([A-z0-9][-A-z0-9]+\\.)+[A-z]{2,4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let emailResult:Bool = emailTest.evaluate(with: email)
        
        let passwordRegex:String = "(?=^.{6,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.+[a-z]).*$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        let passwordResult:Bool = passwordTest.evaluate(with: password)
        
        let testResult = emailResult && passwordResult
        
        return testResult
        
    }

}
