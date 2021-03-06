//
//  jsonDataAssign.swift
//  mykingapp
//
//  Created by Ryan Heaton on 5/14/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

func getAssignDataFromServer(fName: String, lName: String, grade: Int) {
    
    var output = studentData(assignments: [[]], assignmentDate: "", numAssign: 0, name: "")
    
    //a space is %20
    //comma is %2C
    //apostrophe %27
    guard let studentURL = URL(string: "http://10.0.1.200:5000/get/testdata/\(lName)%2C%20\(fName)%20%27\(grade)") else {return}
    
    let request = URLRequest(url: studentURL)
    
    let task = URLSession.shared.dataTask(with: request, completionHandler:
    { (data, response, error) -> Void in
        
        if let data = data {
            //this assigns the studentArray variable (made a private variable outside) to what parseJsonData returns
            print("Data: \(data)")
            output = parseJsonData(data: data)
            print("Output: \(output)")
            AssignmentData.assignmentJsonData = output
            
        }
        if let error = error {
            print(error)
            return
        }
    })
    task.resume()
}

func parseJsonData(data: Data) -> studentData {
    
    let decoder = JSONDecoder()
    var studentValues = studentData(assignments: [[]], assignmentDate: "", numAssign: 0, name: "")
    
    do {
        let jsonDataReturn = try decoder.decode(studentData.self, from: data)
        studentValues = jsonDataReturn.self
        
    } catch {
        print(error)
    }
    return studentValues
}

//assignment arrays are grouped by day -- sunday, monday ... saturday
struct studentData: Decodable {
    var assignments: [[String]]
    var assignmentDate: String
    var numAssign: Int
    var name: String
    
    
    //changing names for struct variables to match ones in json
    enum CodingKeys: String, CodingKey {
        case assignments = "assignments"
        //once ryan fixes assignment name, change this
        case assignmentDate = "date"
        case numAssign = "number_of_assignments"
        case name = "student_name"
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assignments = try values.decode([[String]].self, forKey: .assignments)
        assignmentDate = try values.decode(String.self, forKey: .assignmentDate)
        numAssign = try values.decode(Int.self, forKey: .numAssign)
        name = try values.decode(String.self, forKey: .name)
    }
    
    init(assignments: [[String]], assignmentDate: String, numAssign: Int, name: String) {
        self.assignments = assignments
        self.assignmentDate = assignmentDate
        self.numAssign = numAssign
        self.name = name
    }
}

class AssignmentData {
    static var assignmentJsonData: studentData?
    
    static func getAssignmentData(fName: String, lName: String, grade: Int) -> studentData {
        print(getCurrentDay())
        if let assignmentJsonData = assignmentJsonData {
            return assignmentJsonData
        }
        getAssignDataFromServer(fName: fName, lName: lName, grade: grade)
        while assignmentJsonData == nil {}
        //SavedAssignments.parseToArrObs(classData: decodeAssignments(JSON: assignmentJsonData!))
        return assignmentJsonData!
        
    }
    
    
    static func getCurrentDay() -> Int {
        
        var dayOfWeek = 0
        
        let date = Date()
        let calendar = Calendar.current
        let dayValue = calendar.component(.weekday, from: date)
        
        switch dayValue {
        case 1:
            dayOfWeek = 0
        case 2:
            dayOfWeek = 1
        case 3:
            dayOfWeek = 2
        case 4:
            dayOfWeek = 3
        case 5:
            dayOfWeek = 4
        case 6:
            dayOfWeek = 5
        case 7:
            dayOfWeek = 6
        default:
            return 0
        }
        
        return dayOfWeek
    }
}


//for assignInfo in dayData {
//    let tempAssign = singleAssignment(className: assignInfo[0], type: assignInfo[1], name: assignInfo[2], dateAssigned: assignInfo[3], weekdayDue: Int(assignInfo[4])!, isDone: false)
//    assignMonday?.append(tempAssign)
//}

class SavedAssignments: Codable {
    static var assignmentsList = [[]]
    static var isInit = false
    
    static func parseToArrObs(classData: [[String]]) {
        var count = 0
        for arr in classData {
            if count != 6 {
                assignmentsList.append([])
            }
            let dayData = getClassData(dayArray: arr)
            for assignInfo in dayData {
                let tempAssign = singleAssignment(className: assignInfo[0], type: assignInfo[1], name: assignInfo[2], dateAssigned: assignInfo[3], weekdayDue: Int(assignInfo[4])!, classColor: "", isDone: false)
                assignmentsList[count].append(tempAssign)
            }
        count += 1
        }
        for day in assignmentsList{
            print(day)
        }
    }
    
    static func initAndDayCount(day: Int, letter: String) -> Int{
        if !isInit {
        AssignmentData.getAssignmentData(fName: "Ryan", lName: "Heaton", grade: 21)
        SavedAssignments.parseToArrObs(classData: decodeAssignments(JSON: AssignmentData.assignmentJsonData!))
        isInit = true
        }
        orderAssignments(day: day, letter: letter)
        return assignmentsList[day].count
    }
    
    static func orderAssignments(day: Int, letter: String) {
        let schData = ScheduleData.getScheduleData(fName: "Ryan", lName: "Heaton", grade: 21)
        var schedule = [[String]](repeating: [String](repeating: "", count: 4), count: 8)
        for item in schData.schedule {
            for list in item {
                schedule.append(list.components(separatedBy: ",,"))
            }
        }
        var dayNum = convertLetterToNum(letterDay: letter)
        for _ in 1...day {
            dayNum -= 1
            if dayNum == -1 {
                dayNum = 7
            }
        }

        let days = Days()
        var newAssignmentsList = assignmentsList
        for i in 0...6 {
            newAssignmentsList[i].removeAll()
        }
        var dayNumber = 0
        for singleDay in assignmentsList {
            
            let workingDay = days.GetDay(LetterDay: convertNumToLetter(letterDay: dayNum))
            for period in workingDay {
                var workingClassName = ""
                for item in schedule {
                    if item.contains(period.color) {
                        workingClassName = item[1]
                        //print(workingClassName)
                    }
                }
                for item in singleDay {
                    var dayItem = item as! singleAssignment
                    let end = dayItem.className.index(dayItem.className.endIndex, offsetBy: -4)
                    let range = ...end
                    let tempName = dayItem.className[range]
                    let name = String(tempName)
                    print("\(name) =--= \(workingClassName)")
                    if name == workingClassName {
                        dayItem.classColor = period.color
                        newAssignmentsList[dayNumber].append(dayItem)
                    }
                    
                }
            }
            dayNumber += 1
        }
        print(newAssignmentsList)
        assignmentsList = newAssignmentsList
    }
    
}

struct singleAssignment {
    let className: String
    let type: String
    let name: String
    let dateAssigned: String
    let weekdayDue: Int
    var classColor: String
    var isDone = false
    
    mutating func toggleDone() {
        self.isDone = !self.isDone
    }
    
    
}

//This function returns assigment data
func decodeAssignments(JSON: studentData) -> [[String]] {
    return JSON.assignments
}

//This function gets the assignment data for 1 DAY based on whichever day number you put into the parameters
//(days of the week start on sunday)
func getIndivAssignmentArray(assignmentArray: [[String]], dayIndex: Int) -> [String] {
    return assignmentArray[dayIndex]
}

func convertLetterToNum(letterDay: String) -> Int
{
    var day = 0
    switch letterDay {
    
    case "A":
        day = 0
    case "B":
        day = 1
    case "C":
        day = 2
    case "D":
        day = 3
    case "E":
        day = 4
    case "F":
        day = 5
    case "G":
        day = 6
    case "H":
        day = 7
    default:
        day = 0
        

    }
        return day
}

func convertNumToLetter(letterDay: Int) -> String
{
    var day = ""
    switch letterDay {
        
    case 0:
        day = "A"
    case 1:
        day = "B"
    case 2:
        day = "C"
    case 3:
        day = "D"
    case 4:
        day = "E"
    case 5:
        day = "F"
    case 6:
        day = "G"
    case 7:
        day = "H"
    default:
        day = "A"
        
        
    }
    return day
}

//This returns an array that has each part of the classInfo strings separated into different strings by using the ",," dividers as separation
//The array that it returns has smaller arrays full of each individual class' data in those strings
//Setup of the array: [["class title", "assignment type", "assignment name", "date assigned"], [], [], []]
//To make this work, call the getIndivAssignmentArray function and put in the parameters
func getClassData(dayArray: [String]) -> [[String]] {
    var newArray = [[String]]()
    
    for classInfo in dayArray {
        newArray.append(classInfo.components(separatedBy: ",,"))
    }
    return newArray
}
