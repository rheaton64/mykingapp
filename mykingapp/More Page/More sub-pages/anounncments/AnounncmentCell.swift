//
//  AnouncmentCell.swift
//  mykingapp
//
//  Created by Spencer Creveling on 4/12/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class AnounncmentCell: UITableViewCell {
    @IBOutlet weak var anounncementTitle: UILabel!
    @IBOutlet weak var anounncmentType: UILabel!
    @IBOutlet weak var anouncmentDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
