//
//  LoginViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 3/5/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 10
        passTextField.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        guard let enteredEmail = emailTextField.text, enteredEmail != "",
            let enteredPass = passTextField.text, enteredPass != "" else {
                let alertController = UIAlertController(title: "Login Error", message: "Both fields must not be blank.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                return
        }
        performSegue(withIdentifier: "LoginSegue", sender: nil)
        loginInfo.email = enteredEmail
        loginInfo.pass = enteredPass
    }
    
}














//my parents left me three days ago food is running low send help
