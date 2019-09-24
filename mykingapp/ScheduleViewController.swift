//
//  ScheduleViewController.swift
//  mykingapp
//
//  Created by Spencer Creveling on 4/22/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit
// the lables for all of the static cells
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
    
    @IBOutlet weak var lunch1: UITableViewCell!
    @IBOutlet weak var classLunch1: UILabel!
    @IBOutlet weak var teacherlunch1: UILabel!
    @IBOutlet weak var roomLunch1: UILabel!
    @IBOutlet weak var timeLunch1: UILabel!
    
    @IBOutlet weak var lunch2: UITableViewCell!
    @IBOutlet weak var classLunch2: UILabel!
    @IBOutlet weak var teacherLunch2: UILabel!
    @IBOutlet weak var roomLunch2: UILabel!
    @IBOutlet weak var timeLunch2: UILabel!
    
    
    
    
    
    //updates the day value and as a result re calculates the day and displays the next day schedulale
    @IBAction func Forwards(_ sender: Any) {
        if (day < 7){day += 1} else {day = 0}
        LetterUpdate()
        ParseDay(letterDay:day, today: today)
        stringformat()
        DisplayDay(today: today)
    }
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBAction func Backwards(_ sender: Any) {
        if (day > 0){day -= 1} else {day = 7}
        LetterUpdate()
        ParseDay(letterDay:day, today: today)
        stringformat()
        DisplayDay(today: today)
    }
    
  
    //seting up variables for later
    var letterDay = Letter.getLetterDay()
    var scheduleData: schData?
    var week = [[]]
    var withFrees = [[String]]()
    var day = 0
    var today = [Period]()
    var lunchData = [Bool]()
    override func viewDidLoad() {
        
        //use this to get the current letterday

       
        
        super.viewDidLoad()
        //get the schedule data. will be replaced for a user by user baisis
        scheduleData = ScheduleData.getScheduleData(fName: "Ryan", lName: "Heaton", grade: 21)
        
        // getting this weeks schedule
        week = scheduleData!.schedule
        lunchData = scheduleData!.isFirstLunch
        //calling functions
        convertday()
        ParseDay(letterDay:day, today: today)
        stringformat()
        DisplayDay(today: today)
        
        super.viewDidLoad()
    }
    // this func updates my variables once the user presses the change day button
    func LetterUpdate()
    {
        let days = Days()
        
        switch day {
        case 0:
            today = days.GetDay(LetterDay: "A")
            letterDay = "A"
        case 1:
            today = days.GetDay(LetterDay: "B")
            letterDay = "B"
        case 2:
            today = days.GetDay(LetterDay: "C")
            letterDay = "C"
        case 3:
            today = days.GetDay(LetterDay: "D")
            letterDay = "D"
        case 4:
            today = days.GetDay(LetterDay: "E")
            letterDay = "E"
        case 5:
            today = days.GetDay(LetterDay: "F")
            letterDay = "F"
        case 6:
            today = days.GetDay(LetterDay: "G")
            letterDay = "G"
        case 7:
            today = days.GetDay(LetterDay: "H")
            letterDay = "H"
        default:
            today = days.GetDay(LetterDay: "A")
            letterDay = "A"
            
           
        }
    }

    
 //this function traslates the leter day into a numerical value (only run on first display)
func convertday()
{
    let days = Days()
    
    switch letterDay {
    case "A":
        day = 0
        today = days.GetDay(LetterDay: "A")
    case "B":
        day = 1
        today = days.GetDay(LetterDay: "B")
    case "C":
        day = 2
        today = days.GetDay(LetterDay: "C")
    case "D":
        day = 3
        today = days.GetDay(LetterDay: "D")
    case "E":
        day = 4
        today = days.GetDay(LetterDay: "E")
    case "F":
        day = 5
        today = days.GetDay(LetterDay: "F")
    case "G":
        day = 6
        today = days.GetDay(LetterDay: "G")
    case "H":
        day = 7
        today = days.GetDay(LetterDay: "H")
    default:
        today = days.GetDay(LetterDay: "A")
        day = 0
        
        }
    }
    //this function takes the broken shedule data and fills in frees and fles
    func ParseDay(letterDay: Int, today: [Period])
    {
        
        withFrees = [[String]]()
        
        let currentDay = week[letterDay]
        print(currentDay)
        var referance = today
        var compDay = [[String]]()
        
        referance.remove(at: 0)
        //breaking the json into an array
        for classes in currentDay {
            compDay.append((classes as AnyObject).components(separatedBy: ",,"))
        }
        
        
        var f = 0
        var r = 0
        //goes throug all of the refrence shedule and broke shedule and creates a mended one fit for display
        while(f < compDay.count && r < referance.count)
        {
            //checking if the students shedule has class at a given color
            if compDay[f][0] == referance[r].color
            {
                //if so it adds it to the fixed shedule
                withFrees.append(compDay[f])
                f += 1
            }
            else if (r != 2)
            {
                //if not and its not the flex block it adds a free into the fixed schedule
                withFrees.append([referance[r].color,"Free","                      ", "                      "])
            }
            else if (r == 2)
            {
                //if its flex it adds a flex block into the fixed schedule
                withFrees.append(["grey","Flex","                      ", "                      "])
            }
            r += 1
        }
        // if the user has free last my logic skips it so this just adds on the missing free
        if ( withFrees.count < 7)
        {
         withFrees.append([referance[r].color,"Free","                      ", "                      "])
        }
    }
    
    
    
    
    // this function goes througe and takes the amended schedule and displays it int the cells
    func DisplayDay(today: [Period])
    {
        var classes = 0
        //updating the top label to the proper day
       dayLabel.text = letterDay + " Day"
        //i am only doing comments on the first one because they are the same
        class1.text = withFrees[classes][1] //gets the class name form fixed schedule
        class1.sizeToFit()
        time1.text = GetTime(count: classes) //uses ger time func to display start stop in 12 hour format
        teacher1.text = withFrees[classes][2] //displays teacher name
        teacher1.sizeToFit()
        // chcks if it a free or not and then displays room number
        if(withFrees[classes][3] != "                      "){room1.text =  "Rm:" + withFrees[classes][3]}
       // sets backgound coller based of period color and saved values in color struct
        Cell1.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        Class2.text = withFrees[classes][1]
        Class2.sizeToFit()
        time2.text = GetTime(count: classes)
        teacher2.text = withFrees[classes][2]
        teacher2.sizeToFit()
        if(withFrees[classes][3] != "                      "){room2.text =  "Rm:" + withFrees[classes][3]}
        Cell2.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        class3.text = withFrees[classes][1]
        class3.sizeToFit()
        time3.text = GetTime(count: classes)
        teacher3.text = withFrees[classes][2]
        teacher3.sizeToFit()
        if(withFrees[classes][3] != "                      "){room3.text =  "Rm:" + withFrees[classes][3]}
        Cell3.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        class4.text = withFrees[classes][1]
        class4.sizeToFit()
        time4.text = GetTime(count: classes)
        teacher4.text = withFrees[classes][2]
        teacher4.sizeToFit()
        if(withFrees[classes][3] != "                      "){room4.text =  "Rm:" + withFrees[classes][3]}
        Cell4.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        if(lunchData[day]){ //checking if it is first lunch
            timeLunch1.text = "11:30 - 12:00"
            lunch1.backgroundColor = UIColor( //setting the first lunch block as a blank
                red: CGFloat(0.502),
                green: CGFloat(0.502),
                blue: CGFloat(0.502),
                alpha: CGFloat(1.0))
            classLunch1.text = "Lunch"
            teacherlunch1.text = ""
            
            classLunch2.text = ""  //setting up the second lunch block as the three bottom labels
            timeLunch2.text = "12:00 - 1:20"
            teacherLunch2.text = withFrees[classes][2]
            teacherLunch2.sizeToFit()
            if(withFrees[classes][3] != "                      "){room5.text =  "Rm:" + withFrees[classes][3]}
            lunch2.backgroundColor = UIColor(
                red: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
                green: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
                blue: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
                alpha: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
            
          
        }
        else {
            classLunch1.text = withFrees[classes][1] //setting the first block as the top half of the class
            classLunch1.sizeToFit()
             timeLunch1.text = ""
            lunch1.backgroundColor = UIColor(
                red: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
                green: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
                blue: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
                alpha: CGFloat(colors.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
            
            timeLunch2.text = "12:50 - 1:20" //setting the second block as the lunch
            lunch2.backgroundColor = UIColor(
                red: CGFloat(0.502),
                green: CGFloat(0.502),
                blue: CGFloat(0.502),
                alpha: CGFloat(1.0))
            classLunch2.text = "Lunch"
            teacherLunch2.text = ""
            
        }
        class5.text = ""
        time5.text = "" //setting the block as an aproprite middle section depending on first or second lunch.
        teacher5.text = ""
        room5.text = ""
        
        if (lunchData[day]){
        class5.text = withFrees[classes][1]
        class5.sizeToFit()
            }
        else {
        class5.text = ""
        time5.text = GetTime(count: classes)
        teacher5.text = withFrees[classes][2]
        teacher5.sizeToFit()
        if(withFrees[classes][3] != "                      "){room5.text =  "Rm:" + withFrees[classes][3]}
        }
        Cell5.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        class6.text = withFrees[classes][1]
        class6.sizeToFit()
        time6.text = GetTime(count: classes)
        teacher6.text = withFrees[classes][2]
        teacher6.sizeToFit()
        if(withFrees[classes][3] != "                      "){room6.text =  "Rm:" + withFrees[classes][3]}
        Cell6.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        
        
        classes += 1
        
        
        class7.text = withFrees[classes][1]
        class7.sizeToFit()
        time7.text = GetTime(count: classes)
        teacher7.text = withFrees[classes][2]
        teacher7.sizeToFit()
        if(withFrees[classes][3] != "                      "){room7.text =  "Rm:" + withFrees[classes][3]}
        Cell7.backgroundColor = UIColor(
            red: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 0)),
            green: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 1)),
            blue: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 2)),
            alpha: CGFloat(Color.GetColor(color: withFrees[classes][0].lowercased(), RGBA: 3)))
        classes += 1
    }
    // this function splits the time thats saved like (xxxx) into (xx xx) ie 1230 goes to 12 30 it then covets 24 hour into 12 houre ie 1330 goes to 1 30 and then it returns it as a combind string
    func GetTime (count: Int) -> String
    {
        var time = ""
        var leading = 0
        var trailing = 0
        var leading2 = 0
        var trailing2 = 0
        var changer1 = today[count+1].start
        var changer2 = today[count+1].end
        
        if (changer1 >= 1300) {changer1 -= 1200} // coverting 24 hour time to 12 hour time
        leading = changer1 / 100// gettig the leading num
        trailing = changer1 % 100 //getting the trailing num
        while (trailing < 10 && trailing != 0) {trailing = trailing * 10} //fixing the issue where perfect 10s retun one value
        
        if (changer2 >= 1300) {changer2 -= 1200} //same as above
        leading2 = changer2 / 100
        trailing2 = changer2 % 100
        while (trailing2 < 10 && trailing2 != 0) {trailing2 = trailing2 * 10}
        
        time += "\(leading):\(trailing) - \(leading2):\(trailing2)" //combining the two
        
        return time
    }
    
    
    func stringformat()
    {
        var x = 0
        for words in withFrees
        {
            let temp = words[2]
            let cut = temp.firstIndex(of: " ")
            let end = temp.endIndex
            let start = temp.startIndex
            let first = temp[start]
            let new = temp[cut!..<end]
            var anotherFuckingVariableFuckYouXcode = " "
            if (first != " ")
            {
             anotherFuckingVariableFuckYouXcode = "\(first).\(new)"
            }
            
            withFrees[x][2] = anotherFuckingVariableFuckYouXcode
            
            x += 1
           
        }
    }
    
    
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        let cell = tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath)
    //        cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    //    }
    
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
