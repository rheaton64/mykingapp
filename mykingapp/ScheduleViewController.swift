//
//  ScheduleViewController.swift
//  mykingapp
//
//  Created by Spencer Creveling on 4/22/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {
     @IBOutlet weak var Cell1: UITableViewCell!
    @IBOutlet weak var class1: UILabel!
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var teacher1: UILabel!
    @IBOutlet weak var room1: UILabel!
   
    @IBOutlet weak var Cell2: UITableViewCell!
    @IBOutlet weak var Class2: UILabel!
    @IBOutlet weak var teacher2: UILabel!
    @IBOutlet weak var room2: UILabel!
    @IBOutlet weak var time2: UILabel!
    
    @IBOutlet weak var Cell3: UITableViewCell!
    @IBOutlet weak var class3: UILabel!
    @IBOutlet weak var teacher3: UILabel!
    @IBOutlet weak var room3: UILabel!
    @IBOutlet weak var time3: UILabel!
    
    @IBOutlet weak var Cell4: UITableViewCell!
    @IBOutlet weak var class4: UILabel!
    @IBOutlet weak var teacher4: UILabel!
    @IBOutlet weak var room4: UILabel!
    @IBOutlet weak var time4: UILabel!
    
    @IBOutlet weak var Cell5: UITableViewCell!
    @IBOutlet weak var class5: UILabel!
    @IBOutlet weak var teacher5: UILabel!
    @IBOutlet weak var room5: UILabel!
    @IBOutlet weak var time5: UILabel!
    
    @IBOutlet weak var Cell6: UITableViewCell!
    @IBOutlet weak var teacher6: UILabel!
    @IBOutlet weak var room6: UILabel!
    @IBOutlet weak var class6: UILabel!
    @IBOutlet weak var time6: UILabel!
    
    @IBOutlet weak var Cell7: UITableViewCell!
    @IBOutlet weak var class7: UILabel!
    @IBOutlet weak var teacher7: UILabel!
    @IBOutlet weak var room7: UILabel!
    @IBOutlet weak var time7: UILabel!
    
    var scheduleData: schData?
    
    
    override func viewDidLoad() {
        
        let letterDay = Letter.getLetterDay()
        
        class1.text = "Advaced Seminar Swift"
        class1.sizeToFit()
        time1.text = "1:15 (60)"
        teacher1.text = "Dionisius, Isabelle"
        teacher1.sizeToFit()
        room1.text = "Rm: 215"
        let colors = Colors()
        Cell1.backgroundColor = UIColor(
            red: CGFloat(colors.GetColor(color: "tan", RGBA: 0)),
            green: CGFloat(colors.GetColor(color: "tan", RGBA: 1)),
            blue: CGFloat(colors.GetColor(color: "tan", RGBA: 2)),
            alpha: CGFloat(colors.GetColor(color: "tan", RGBA: 3)))
       
        
        super.viewDidLoad()
        
        scheduleData = ScheduleData.getScheduleData(fName: "Ryan", lName: "Heaton", grade: "21")
        print("Data that I have now: \(scheduleData!.name)")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let cell = tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath)
//        cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//    }
    
    @IBAction func AButton(_ sender: Any) {
        //when button s bushed info is put in
        //to be replaces later
      
    }
    
   
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
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




//day 14 without natural light and my eyes can now see in the dark
