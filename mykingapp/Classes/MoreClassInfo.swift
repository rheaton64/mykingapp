//
//  MoreClassInfo.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/1/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

class MoreClassInfo: UIViewController {
    //reciving data
    var passedName = " "
    var passedColor = UIColor.black
    
    
    @IBOutlet weak var selectedClassName: UILabel!
    
    override func viewDidLoad() {
        selectedClassName.text = passedName
        selectedClassName.backgroundColor = passedColor
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}







//the end is near ryan is all
