//
//  LoginViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 3/5/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        createAlertLogin()
    }
    
    func createAlertLogin(){
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        let alertController = UIAlertController(
            title: "Sign in",
            message: "Please enter your credentials",
            preferredStyle: .alert)
        
        let loginAction = UIAlertAction(
        title: "Log in", style: .default) {
            (action) -> Void in
//login in code goes here
            if let username = usernameTextField?.text {
                print(" Username = \(username)")
            } else {
                print("No Username entered")
            }
            if let password = passwordTextField?.text {
                print("Password = \(password)")
            } else {
                print("No password entered")
            }
            
            self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            
        }
        
        alertController.addTextField {
            (txtUsername) -> Void in
            usernameTextField = txtUsername
            usernameTextField!.placeholder = "Username"
        }
        
        alertController.addTextField {
            (txtPassword) -> Void in
            passwordTextField = txtPassword
            passwordTextField?.isSecureTextEntry = true
            passwordTextField?.placeholder = "Password"
        }
        
        alertController.addAction(loginAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}
