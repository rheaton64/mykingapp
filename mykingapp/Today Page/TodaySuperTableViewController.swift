//
//  TodaySuperTableViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 2/3/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var assignmentDetail: [String] = ["Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all", "Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all"]
    var assignmentClass: [String] = ["AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C", "AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C"]
    var classColor: [UIColor] = [UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple, UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple]
    var assignmentHeader: [String] = ["5.1 B", "AP Review Questions", "Rotational Motion", "5.1 B", "AP Review Questions", "Rotational Motion"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subcell = tableView.dequeueReusableCell(withIdentifier: "dynamicCell", for: indexPath) as! AssignmentsTableViewCell
        subcell.assignmentNumber.layer.cornerRadius = 21
        subcell.assignmentNumber.layer.borderColor = UIColor.orange.cgColor
        subcell.assignmentNumber.layer.borderWidth = 2
        subcell.assignmentNumber.text = "\(indexPath.row + 1)"
        subcell.assignmentClassLbl.text = assignmentClass[indexPath.row]
        subcell.assignmentClassLbl.textColor = classColor[indexPath.row]
        subcell.assignmentHeaderLbl.text = assignmentHeader[indexPath.row]
        subcell.assignmentDetailLbl.text = assignmentDetail[indexPath.row]
        
        return subcell
    }
    
}

class TodaySuperTableViewController: UITableViewController {

    @IBOutlet weak var dynamicTableView: UITableView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var assignmentsView: UIView!
    @IBOutlet weak var testsView: UIView!
    @IBOutlet weak var eventsView: UIView!
    
    let sections: [String] = ["", "TODAY", "ASSIGNMENTS"]
    let colors: [UIColor] = [.white, .red, .orange]
    var datasource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFunc()
        getTodayItemBorder()
        dynamicTableView.dataSource = datasource
        dynamicTableView.delegate = datasource
    }
    
    func getTodayItemBorder(){
        let blueColor = UIColor(red: 81/255, green: 150/255, blue: 255/255, alpha: 0.75)
        assignmentsView.layer.borderWidth = 3
        assignmentsView.layer.borderColor = blueColor.cgColor
        assignmentsView.layer.cornerRadius = 15
        
        testsView.layer.borderWidth = 3
        testsView.layer.borderColor = blueColor.cgColor
        testsView.layer.cornerRadius = 20
        
        eventsView.layer.borderWidth = 3
        eventsView.layer.borderColor = blueColor.cgColor
        eventsView.layer.cornerRadius = 20
    }
    
    //gets current date formatted appropriately
    //and displays it in the nav bar label
    func dateFunc(){
        let today = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE    MMMM d"
        DateLabel.text = format.string(from: today).uppercased()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let label = UILabel()
        label.text = sections[section]
        label.frame = CGRect(x: 16, y: 5, width: 200, height: 35)
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = colors[section]
        view.addSubview(label)
        return view
    }
    
    var height = Int()
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            height = 1
        } else {
            height = 40
        }
        return CGFloat(height)
    }

    // MARK: - Table view data source
   override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //ALERT CONTROLLER LOGIN POP UP
    //maybe encorporate faceID/finger print reading functionality...
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
