//
//  LoginViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 3/5/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 10
        gradeTextField.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        guard let enteredName = nameTextField.text, enteredName != "",
            let enteredGrade = gradeTextField.text, enteredGrade != "" else {
                let alertController = UIAlertController(title: "Login Error", message: "Both fields must not be blank.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                return
        }
        performSegue(withIdentifier: "LoginSegue", sender: nil)
        loginInfo.name = enteredName
        loginInfo.grade = enteredGrade
        //var userLogin = loginInfo(username: name, grade: grade)
    }
    
}


