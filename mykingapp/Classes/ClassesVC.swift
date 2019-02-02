//
//  ClassesVC.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/1/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class ClassesVC: UITableViewController {
    //passing data
    var selectedCell = 0
    
    //test data
    // all classes
    var studentclass: [String] = ["Study Stratigies","Swift  App Development","Engineering","American Literature", "French 301", "Honors Pre-Calculus", "Honors Physics", "Honors US History"]
    
    var Colors: [UIColor] = [UIColor.blue, UIColor(red: 0.8196, green: 0.6627, blue: 0.4588, alpha: 1.0) /* #d1a975 tan */, UIColor.red, UIColor(red: 0, green: 0.8392, blue: 0.0275, alpha: 1.0) /* #00d607 Green */, UIColor(red: 1, green: 0.8157, blue: 0, alpha: 1.0) /* #ffd000 Yellow */, UIColor.purple, UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0) /* #ff1493 Pink */, UIColor.orange]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentclass.count
    }
    //giving cells names and color
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath) as! ClassCell
        cell.classLable.text = studentclass[indexPath.row]
        cell.classLable.backgroundColor = Colors[indexPath.row]
        return cell
    }
    //setting cell sizes to 100
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
    //unselecting cell and checking wiche one is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
        selectedCell = indexPath.row
    }
    // using the variable  above I pass the apropriate data from my arrays
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoreInfo" {
          let passingTo = segue.destination as! MoreClassInfo
            passingTo.passedName = studentclass[selectedCell]
            passingTo.passedColor = Colors[selectedCell]
        }
    }
    }


