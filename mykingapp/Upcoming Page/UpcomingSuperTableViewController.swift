//
//  UpcomingSuperTableViewController.swift
//  mykingapp
//
//  Created by Natasha  on 2/26/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class DataSource1: NSObject, UITableViewDelegate, UITableViewDataSource {

    var assignmentDetail: [String] = ["Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all", "Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all"]
    var assignmentClass: [String] = ["AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C", "AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C"]
    var classColor: [UIColor] = [UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple, UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple]
    var assignmentHeader: [String] = ["5.1 B", "AP Review Questions", "Rotational Motion", "5.1 B", "AP Review Questions", "Rotational Motion"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignmentClass.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subcell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! UpcomingAssignTableViewCell
        subcell.assignmentNumber.layer.cornerRadius = 21
        subcell.assignmentNumber.layer.borderColor = UIColor.orange.cgColor
        subcell.assignmentNumber.layer.borderWidth = 2
        subcell.assignmentNumber.text = "\(indexPath.row + 1)"
        subcell.assignClassLabel.text = assignmentClass[indexPath.row]
        subcell.assignClassLabel.textColor = classColor[indexPath.row]
        subcell.assignHeaderLabel.text = assignmentHeader[indexPath.row]
        subcell.assignDetailLabel.text = assignmentDetail[indexPath.row]

        return subcell
    }

}

class UpcomingSuperTableViewController: UITableViewController {

    @IBOutlet weak var dynamicView: UITableView!
    
    let sections: [String] = ["", "ASSIGNMENTS"]
    let colors: [UIColor] = [.white, .orange]
    var datasource1 = DataSource1()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dynamicView.dataSource = datasource1
        dynamicView.delegate = datasource1
        dynamicView.separatorStyle = .none
        
    }

    // MARK: - Table view data source

    //this function sets the "assignment" label above the inside table view to be
    //larger and orange.
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
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

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

}
