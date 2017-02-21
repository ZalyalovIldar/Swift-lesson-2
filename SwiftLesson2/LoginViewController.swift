//
//  LoginViewController.swift
//  SwiftLesson2
//
//  Created by Наталья on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  
    @IBAction func loginButtonDidClicked(_ sender: UIButton) {
        
        
        
        let status:Bool = LoginManager().login(login: loginTextField.text!,
                                                            password: passwordTextField.text!)
        if status {
            dismiss(animated: true, completion: nil)
        }else {
            let alert = UIAlertController.init(title: "Ошибка", message: " Неверный логин или пароль", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}
