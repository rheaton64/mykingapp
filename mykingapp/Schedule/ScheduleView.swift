//
//  ScheduleView.swift
//  mykingapp
//
//  Created by Spencer Creveling on 3/28/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class ScheduleView: UITableViewController {

    var Schedule = [ClassStuff]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }

}
