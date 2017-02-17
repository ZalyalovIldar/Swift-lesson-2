//
//  SignInViewController.swift
//  SwiftLesson2
//
//  Created by Ленар on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInButton.layer.cornerRadius = 5
    }

    @IBAction func SignInButtonAction(_ sender: UIButton) {
        let user = User(email:emailTextField.text!, password: passwordTextField.text!)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Table")
        
        if user.isValidUserData {
            let userData = UserDefaults.standard
            userData.set(true, forKey: "SignIn")
            userData.set(false, forKey: "SignInLaunched")
            userData.synchronize()
            present(viewController, animated: true, completion: nil)
        } else {
            let alert:UIAlertController = UIAlertController(title: "Ошибка!", message: "Введен неверный email/пароль", preferredStyle: .alert)
            let okAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
