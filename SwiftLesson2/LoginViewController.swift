//
//  LoginViewController.swift
//  SwiftLesson2
//
//  Created by Никита Солдатов on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action handlers
    @IBAction func loginButtonDidClicked(_ sender: Any) {
        let authorisationManager = AuthorizationManager.sharedInstance
        
        let authorisationStatus = authorisationManager.login(with: loginTextField.text!, and: passwordTextField.text!)
        if authorisationStatus.boolValue() {
            dismiss(animated: true, completion: nil)
        }else {
            let alertController = UIAlertController.init(title: "Ошибка", message: "Неверная пара логин/пароль", preferredStyle: UIAlertControllerStyle.alert)
            let doneAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(doneAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }

}
