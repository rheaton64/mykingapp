//
//  AssignmentsTableViewCell.swift
//  mykingapp
//
//  Created by Luke Nascimento on 2/5/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class AssignmentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assignmentNumber: UILabel!
    @IBOutlet weak var assignmentClassLbl: UILabel!
    @IBOutlet weak var assignmentDetailLbl: UILabel!
    @IBOutlet weak var assignmentHeaderLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
