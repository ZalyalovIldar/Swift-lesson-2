//
//  Authorization.swift
//  SwiftLesson2
//
//  Created by Rustam N on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class Authorization: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var secondView: UIView!
    let userDefaults = Foundation.UserDefaults.standard
   

    override func viewDidLoad() {
        if userDefaults.bool(forKey: "isAutohorization") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let listsVC = storyboard.instantiateViewController(withIdentifier: "Lists") as! Lists
            self.present(listsVC, animated: true, completion: nil)
        }
        else {
            self.scroll.contentInset = UIEdgeInsetsMake(0, 0, 5, 0);
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        passwordTextField.text = ""
    }
    
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
        if !Helper.regularCheck(for: "[a-zA-Z0-9]+@(([a-zA-Z0-9\\-]+\\.)([a-zA-Z0-9\\-])+)+", in: emailTextField.text!){
            let alert = Helper.allert(alertTitle: "Incorect email", message: "Correct email", actionTitle: "Ok")
            self.present(alert, animated: true, completion: nil)
        }
        if !Helper.regularCheck(for: "[[A-ZА-Я]+[0-9]+[a-zа-я]+]{6,}", in: passwordTextField.text!){
            let alert = Helper.allert(alertTitle: "Incorect password", message: "Correct password", actionTitle: "Ok")
            self.present(alert, animated: true, completion: nil)
        }
        else{
            userDefaults.set(true, forKey: "isAutohorization")
        }
    }
    
}
