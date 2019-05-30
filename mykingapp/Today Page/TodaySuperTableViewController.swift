//
//  TodaySuperTableViewController.swift
//  mykingapp
//
//  Created by Luke Nascimento on 2/3/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit

struct assignments {
    var assignmentIsDone = Bool()
}

class DataSource: NSObject, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var dynamicTableView: UITableView!
    
//    var assignmentDetail: [String] = ["Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all", "Do problems 1-21 odd on page 324, circle any questions you do not know how to do", "Omit #1, 22, 24, 25, 26, 27, 31, 33, 34, 35, be prepared to show me in class", "Review packet questions 1-10 all"]
//    var assignmentClass: [String] = ["AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C", "AP CALCULUS AB", "AP COMPUTER SCIENCE A", "AP PHYSICS C"]
    var classColor: [UIColor] = [UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple, UIColor(red: 1, green: 0.0784, blue: 0.5765, alpha: 1.0), .orange, .purple]
//    var assignmentHeader: [String] = ["5.1 B", "AP Review Questions", "Rotational Motion", "5.1 B", "AP Review Questions", "Rotational Motion"]
    
    
    
    var assignmentIsDone = Array(repeating: false, count: SavedAssignments.initAndDayCount(day: AssignmentData.getCurrentDay()))
    
    var assignmentsToday = SavedAssignments.assignmentsList[AssignmentData.getCurrentDay()]
    
    
    
//    let instanceOfTodayView = TodaySuperTableViewController()
//    var classData = [[String]]()
//    var assignmentOfDay = [String]()
//    var classDataForDay = [[String]]()

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedAssignments.initAndDayCount(day: AssignmentData.getCurrentDay())
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subcell = tableView.dequeueReusableCell(withIdentifier: "dynamicCell", for: indexPath) as! AssignmentsTableViewCell
        
        subcell.assignmentNumber.layer.cornerRadius = 21
        subcell.assignmentNumber.layer.borderColor = UIColor.orange.cgColor
        subcell.assignmentNumber.layer.borderWidth = 2
        subcell.assignmentNumber.text = "\(indexPath.row + 1)"
        subcell.assignmentClassLbl.text = (assignmentsToday[indexPath.row] as! singleAssignment).className
        subcell.assignmentClassLbl.textColor = classColor[indexPath.row]
        subcell.assignmentHeaderLbl.text = (assignmentsToday[indexPath.row] as! singleAssignment).name
        subcell.assignmentDetailLbl.text = "This is a description"
        
        //handles assignments that are done to prevent reusable cell bug
        subcell.assignmentNumber.layer.backgroundColor = (assignmentsToday[indexPath.row] as! singleAssignment).isDone  ? UIColor.orange.cgColor : UIColor.white.cgColor
        subcell.accessoryType = (assignmentsToday[indexPath.row] as! singleAssignment).isDone ? .checkmark : .none
        
        return subcell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //tableview swipe action
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneCell = tableView.cellForRow(at: indexPath) as! AssignmentsTableViewCell
        
        let notDoneAction = UIContextualAction(style: .normal, title:  "Not Done", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            doneCell.assignmentNumber.textColor = UIColor.orange
            doneCell.assignmentNumber.layer.backgroundColor = UIColor.white.cgColor
            self.toggleDoneForAssign(index: indexPath.row)
            print("Marked as not done")
            success(true)
        })
        let doneAction = UIContextualAction(style: .normal, title:  "Done", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            doneCell.assignmentNumber.textColor = UIColor.white
            doneCell.assignmentNumber.layer.backgroundColor = UIColor.orange.cgColor
            self.toggleDoneForAssign(index: indexPath.row)
            print("Marked as done")
            success(true)
        })
        doneAction.backgroundColor = .green
        notDoneAction.backgroundColor = .red
        
        //let notDone = UISwipeActionsConfiguration(actions: [notDoneAction])
        var action = UIContextualAction()
            if ((assignmentsToday[indexPath.row] as! singleAssignment).isDone == true){
                action = notDoneAction
            } else {
                action = doneAction
            }
            let action1 = UISwipeActionsConfiguration(actions: [action])
            action1.performsFirstActionWithFullSwipe = true
            return action1
    }
    
    func toggleDoneForAssign(index: Int) {
        if var assign = assignmentsToday[index] as? singleAssignment {
            assign.toggleDone()
        }
    }
}

class TodaySuperTableViewController: UITableViewController {

    @IBOutlet weak var dynamicTableView: UITableView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var letterDayLabel: UILabel!
    @IBOutlet weak var assignmentsView: UIView!
    @IBOutlet weak var testsView: UIView!
    @IBOutlet weak var eventsView: UIView!
    @IBOutlet weak var periodProgressBar: UIProgressView!
    
//    //static var studentArray = AssignmentData.getAssignmentData(fName: "Ryan", lName: "Heaton", grade: 21)
//    static var classData = decodeAssignments(JSON: TodaySuperTableViewController.studentArray)
//    static var assignmentOfDay = getIndivAssignmentArray(assignmentArray: TodaySuperTableViewController.classData, dayIndex: AssignmentData.getCurrentDay())
//    //This returns an array that has each part of the classInfo strings separated into different strings by using the ",," dividers as separation
//    //The array that it returns has smaller arrays full of each individual class' data in those strings
//    //Setup of the array: [["class title", "assignment type", "assignment name", "date assigned"], [], [], []]
//    //To access the first class and its title, you would call the assigned variable (ex: assignDay) and use a 2D array --> assignDay[0][0]
//    //To make this work, call the getIndivAssignmentArray function and put in the parameters
//    static var classDataForDay = getClassData(dayArray: TodaySuperTableViewController.assignmentOfDay)
    
    let sections: [String] = ["", "TODAY", "ASSIGNMENTS"]
    let colors: [UIColor] = [.white, .red, .orange]
    var datasource = DataSource()
    
    func ProgressBar()
    {
        let day = Days() // creating instance of day struct
        let letter = Letter.getLetterDay() // replace with json request
        let schedule = day.GetDay(LetterDay: letter)//getting array of the curent scheduale
        let date = Date()// creating date object
        let calendar = Calendar.current// creating calender object
        let hour = (calendar.component(.hour, from: date)) // getting curent hour 24 format
        let minutes = calendar.component(.minute, from: date)// getting the current min
        let time = (hour * 100) + minutes// combinding hours is HHMM format as int
        let period = day.GetPeriod(time: time)//requetsting current period giving time HHMM
        let colors = Colors() //Creating instace of color struct
        
        letterDayLabel.text? = letter
        
        //for each rgba value i call the get color function.
        //I provide the current period's.color object for the color parameter
        // i the provide the respective number for the rgba paramater
        periodProgressBar.trackTintColor = UIColor(
            red: CGFloat(colors.GetColor(color: schedule[period].color, RGBA: 0)),
            green: CGFloat(colors.GetColor(color: schedule[period].color, RGBA: 1)),
            blue: CGFloat(colors.GetColor(color: schedule[period].color, RGBA: 2)),
            alpha: CGFloat(colors.GetColor(color: schedule[period].color, RGBA: 3)))
        
        if period < 7 {
            //same as above
        periodProgressBar.progressTintColor = UIColor(
            red: CGFloat(colors.GetColor(color: schedule[period+1].color, RGBA: 0)),
            green: CGFloat(colors.GetColor(color: schedule[period+1].color, RGBA: 1)),
            blue: CGFloat(colors.GetColor(color: schedule[period+1].color, RGBA: 2)),
            alpha: CGFloat(colors.GetColor(color: schedule[period+1].color, RGBA: 3)))
        }
        else {
            //displaying white for no class
            periodProgressBar.progressTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        }
        
        let interval = Double(schedule[period].end - schedule[period].start)
        let timeLeft = Double(schedule[period].end - time)
        periodProgressBar.setProgress(Float((interval - timeLeft) / 100), animated: false)
        
    }
    
   
    override func viewDidLoad() {

    
       ProgressBar()
        super.viewDidLoad()
        dateFunc()
        getTodayItemBorder()
        dynamicTableView.dataSource = datasource
        dynamicTableView.delegate = datasource
        
        //code to fix header for IPhone X
        let dummyViewHeight = CGFloat(45)
        self.tableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
        
        //STRINGS HOLDING NAME AND GRADE, FOR JSON
        let name = String(describing: loginInfo.name!)
        let grade = String(describing: loginInfo.grade!)
        print("Entered Name: \(name), Entered Grade: \(grade)")
    }
    
    //UI Stuff
    func getTodayItemBorder(){
        let blueColor = UIColor(red: 81/255, green: 150/255, blue: 255/255, alpha: 0.75)
        assignmentsView.layer.borderWidth = 3
        assignmentsView.layer.borderColor = blueColor.cgColor
        assignmentsView.layer.cornerRadius = 15
        
        testsView.layer.borderWidth = 3
        testsView.layer.borderColor = blueColor.cgColor
        testsView.layer.cornerRadius = 20
        
        eventsView.layer.borderWidth = 3
        eventsView.layer.borderColor = blueColor.cgColor
        eventsView.layer.cornerRadius = 20
    }
    
    //gets current date formatted appropriately
    //and displays it in the nav bar label
    func dateFunc(){
        let today = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE \nMMMM d"
        DateLabel.text = format.string(from: today).uppercased()
    }
    
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
    
    var height = Int()
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            height = 1
        } else {
            height = 40
        }
        return CGFloat(height)
    }

    // MARK: - Table view data source
   override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = CGFloat(25)
        let navigationBar = self.navigationController?.navigationBar
        navigationBar!.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
    }

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








//he can smell you, you know
