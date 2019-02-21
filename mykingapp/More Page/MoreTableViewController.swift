//
//  MoreTableViewController.swift
//  mykingapp
//
//  Created by Natasha  on 2/20/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //these make each of the disclosure indicators show up for each row 
        let cell = tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath)
        cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        let cell1 = tableView.cellForRow(at: NSIndexPath(row: 1, section: 0) as IndexPath)
        cell1!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        let cell2 = tableView.cellForRow(at: NSIndexPath(row: 2, section: 0) as IndexPath)
        cell2!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        let cell3 = tableView.cellForRow(at: NSIndexPath(row: 3, section: 0) as IndexPath)
        cell3!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        let cell4 = tableView.cellForRow(at: NSIndexPath(row: 4, section: 0) as IndexPath)
        cell4!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
    }
    
   
}
