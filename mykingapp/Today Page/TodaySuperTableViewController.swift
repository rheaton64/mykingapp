//
//  TodaySuperTableViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 2/3/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class TodaySuperTableViewController: UITableViewController {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var assignmentsView: UIView!
    @IBOutlet weak var testsView: UIView!
    @IBOutlet weak var eventsView: UIView!
    
    let sections: [String] = ["", "TODAY", "ASSIGNMENTS"]
    let colors: [UIColor] = [.white, .red, .orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFunc()
        getTodayItemBorder()
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
        format.dateFormat = "EEEE MMMM d"
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
    
    // MARK: - Table view data source
//CLOSED OFF FOR UI TESTING PURPOSES, WILL GET SIGBRT IF IT
    //IS NOT CLOSED OFF 
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
            title: "Log in",
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
