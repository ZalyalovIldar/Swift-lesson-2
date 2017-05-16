//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Ildar Zalyalov on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    
    let emailRegX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let passwordRegX = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6}$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegX)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegX)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
    @IBAction func enterButton(_ sender: Any) {
        if isValidEmail(email: eMailTextField.text!) && isValidPassword(password: passwordTestField.text!){
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "entered")
            userDefaults.synchronize()
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "segue", sender: nil)
        }else{
            let alertController = UIAlertController(title: "Attention!", message: "Your password or e-mail incorrect", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        }
    }

}


