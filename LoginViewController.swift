//
//  LoginViewController.swift
//  SwiftLesson2
//
//  Created by Gulia_Is on 16.03.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let status:Bool = LoginManager().login(login: emailTextField.text!,
                                               password: passwordTextField.text!)
        if status {
            dismiss(animated: true, completion: nil)
        }else {
            let alert = UIAlertController.init(title: "Error", message: "Invalid login or password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
