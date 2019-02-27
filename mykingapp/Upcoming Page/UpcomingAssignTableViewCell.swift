//
//  UpcomingAssignTableViewCell.swift
//  mykingapp
//
//  Created by Natasha  on 2/26/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class UpcomingAssignTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var assignmentNumber: UILabel!
    @IBOutlet weak var assignClassLabel: UILabel!
    @IBOutlet weak var assignHeaderLabel: UILabel!
    @IBOutlet weak var assignDetailLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
