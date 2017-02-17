//
//  UserStruct.swift
//  SwiftLesson2
//
//  Created by Ленар on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

struct User {
    var email:String
    var password:String
}

extension User{
    var isValidUserData: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        let passwordFormat:String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        let correct:Bool =  emailPredicate.evaluate(with: self.email)&&passwordPredicate.evaluate(with: self.password)
        
        return correct
    }
}
