//
//  Helper.swift
//  SwiftLesson2
//
//  Created by Rustam N on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class Helper: UIViewController {
    
    class func allert(alertTitle: String, message: String, actionTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.cancel, handler: nil))
    return alert
    }
    
    class func regularCheck(for regex: String, in text: String) -> Bool {
        if let range = text.range(of:regex, options: .regularExpression) {
            let result = text.substring(with:range)
            if result.characters.count == text.characters.count{
                return true
            }
        }
        return false
    }

    
}


