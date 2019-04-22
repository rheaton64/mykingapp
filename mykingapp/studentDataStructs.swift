//
//  studentDataStructs.swift
//  mykingapp
//
//  Created by Natasha  on 3/8/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

let json = """
[{"student_name":"Heaton, Ryan '21","date":"2/20/2019","number_of_assignments":{"$numberInt":"0"},"assignmnets":[[],["Spanish III(3),,,,PRESIDENTS' DAY - NO HAY ESCUELA,,Assigned: 02/18/2019,,1"],["European History - AP(1),,Test,,Take-Home Portion,,Assigned: 02/04/2019,,2","Spanish III(3),,,,DROP DAY - NO  HAY CLASE HOY,,Assigned: 02/19/2019,,2","PreCalculus BC - Honors(2),,Homework,,Suggested Exercises,,Assigned: 02/15/2019,,2"],["Chemistry - Honors(2),,Homework,,MC - Heats of Formation HW  (OPTIONAL),,Assigned: 02/13/2019,,3","Chemistry - Honors(2),,Homework,,Submimt Questions for Q&A,,Assigned: 02/13/2019,,3","Spanish III(3),,Oral work,,﻿LAS PRESENTACIONES: SKIT PRESENTATIONS...,,Assigned: 02/20/2019,,3","Writing About Literature - Honors(2),,,,poetry by heart: Larkin,,Assigned: 02/20/2019,,3","Writing About Literature - Honors(2),,,,reading and notes: Atwood,,Assigned: 02/20/2019,,3","PreCalculus BC - Honors(2),,Quiz,,Quiz 9.1, 9.2,,Assigned: 02/15/2019,,3"],["Spanish III(3),,,,﻿REPASO:  Review - Cuaderno, p. 39...,,Assigned: 02/21/2019,,4","European History - AP(1),,Engagement,,Chapters 14-16 Chapter Guides,,Assigned: 02/18/2019,,4","Writing About Literature - Honors(2),,Vocabulary,,poetry by heart: QUIZ,,Assigned: 02/21/2019,,4","Writing About Literature - Honors(2),,,,reading and notes: Atwood,,Assigned: 02/21/2019,,4","PreCalculus BC - Honors(2),,Homework,,Equations 2 (handout I gave you and called suggest...,,Assigned: 02/20/2019,,4"],["Chemistry - Honors(2),,Test,,Ch 5 Test,,Assigned: 02/11/2019,,5","Spanish III(3),,,,﻿Handout - more practice with commands</...,,Assigned: 02/22/2019,,5","Writing About Literature - Honors(2),,Grammar,,grammar: QUIZ,,Assigned: 02/22/2019,,5","Writing About Literature - Honors(2),,,,reading and notes: Atwood,,Assigned: 02/22/2019,,5","European History - AP(1),,Writing,,IN-CLASS DBQ,,Assigned: 02/18/2019,,5"],[]]},
{"student_name":"Nascimento, Luke '19","date":"2/20/2019","number_of_assignments":{"$numberInt":"0"},"assignmnets":[[],[],["Calculus AB - AP(1),,Homework,,HW 5.3B,,Assigned: 02/13/2019,,2"],[],["English: Fiction into Film(1),,Writing,,﻿ANGELA'S ASHES ʌ,,Assigned: 02/19/2019,,4","English: Fiction into Film(1),,,,﻿ANGELA'S ASHES ʌ,,Assigned: 02/20/2019,,4"],["Computer Science A - AP(2),,Test,,Test on Inheritance,,Assigned: 02/12/2019,,5","Calculus AB - AP(1),,Homework,,HW 5.3C - Riemann Sums,,Assigned: 02/19/2019,,5"],[]]},
{"student_name":"Aysseh, Natasha '19","date":"2/20/2019","number_of_assignments":{"$numberInt":"0"},"assignmnets":[[],["English Literature - AP(1),,,,NO SCHOOL,,Assigned: 02/03/2019,,1"],["Comp. Gov. and Politics - AP(1),,Test,,CHINA TEST,,Assigned: 02/08/2019,,2","English Literature - AP(1),,,,Reading,,Assigned: 02/03/2019,,2","Calculus BC - AP(1),,Homework,,Section 6.5 of Lesson 29,,Assigned: 02/03/2019,,2"],["Calculus BC - AP(1),,Homework,,Section 6.6 HW A,,Assigned: 02/03/2019,,3","Physics 1 - AP(2),,Test,,AP 1   Rotational Motion Test,,Assigned: 02/10/2019,,3","Comp. Gov. and Politics - AP(1),,Engagement,,RUSSIA READING - O'Neil - Blue Book,,Assigned: 02/15/2019,,3","Calculus BC - AP(1),,Homework,,Section 6.6 HW A,,Assigned: 02/19/2019,,3"],["French Language - AP(1),,Presentation,,PAUL - CHAPTER PRESENTATION & REVISION,,Assigned: 01/27/2019,,4","Comp. Gov. and Politics - AP(1),,Engagement,,RUSSIA READING - O'Neil - Blue Book,,Assigned: 02/15/2019,,4","French Language - AP(1),,Writing,,Etudier le vocabulaire sur le Nationalisme te le P...,,Assigned: 02/18/2019,,4","English Literature - AP(1),,,,Writing Workshop,,Assigned: 02/18/2019,,4"],["Calculus BC - AP(1),,Quiz,,Quiz Numerical Series,,Assigned: 02/13/2019,,5","English Literature - AP(1),,,,The Secret History, Chapter One,,Assigned: 02/21/2019,,5","English Literature - AP(1),,Quiz,,AP Practice,,Assigned: 02/19/2019,,5"],[]]},
{"student_name":"Creveling, Spencer '20","date":"2/19/2019","number_of_assignments":{"$numberInt":"0"},"assignmnets":[[],[],["United States History - Honors(1),,Homework,,Read p. 593-601 (Stop at “The Grant Adm...,,Assigned: 02/11/2019,,2","Physics - Honors(1),,Quiz,,Circuits Quiz,,Assigned: 02/10/2019,,2"],["PreCalculus(3),,Homework,,No Homework Due,,Assigned: 02/20/2019,,3"],["PreCalculus(3),,Homework,,Trig HW2,,Assigned: 02/20/2019,,4","American Literature(2),,,,reading/viewing: Deliverance,,Assigned: 02/21/2019,,4"],["United States History - Honors(1),,Homework,,,,Assigned: 02/20/2019,,5","Physics - Honors(1),,Test,,Electricity Test - Statics and Circuits,,Assigned: 02/18/2019,,5"],[]]}]
"""

//assignment arrays are grouped by day -- sunday, monday ... saturday
struct studentData: Codable {
    var assignments: [[String]]
    var assignmentDate: String
    var numAssign: Int
    var name: String
    
    
    //changing names for struct variables to match ones in json
    enum CodingKeys: String, CodingKey {
        case assignments = "assignmnets"
        case assignmentDate = "date"
        case numAssign = "number_of_assignments"
        case name = "student_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assignments = try values.decode([[String]].self, forKey: .assignments)
        assignmentDate = try values.decode(String.self, forKey: .assignmentDate)
        numAssign = try values.decode(Int.self, forKey: .numAssign)
        name = try values.decode(String.self, forKey: .name)
    }

}


struct JSONDataStore: Codable {
    var jsonDatas: [studentData]
}



//This function decodes assigment data
//the index parameter is because of the given json above, w server it'll be different
/*
func decodeAssignments(indexOfJSON: Int) -> [[String]] {
    let decoder = JSONDecoder()

    if let jsonData = json.data(using: .utf8) {

        do {
            let data = try decoder.decode([studentData].self, from: jsonData)
            return (data[indexOfJSON].assignments) //TRYING W ASSIGNMENTS

        } catch {
            print(error)
        }
    }
    return [[""]]
}
 */

//This function decodes the name inside the array, returns the name part of the json
//this might not be necessary???
/*
 func decodeName(indexOfJSON: Int) -> String {
    let decoder = JSONDecoder()
    if let jsonData = json.data(using: .utf8) {
        
        do {
            let data = try decoder.decode([studentData].self, from: jsonData)
            return (data[indexOfJSON].name)
        } catch {
            print(error)
        }
    }
    return ""
}
*/

//This function gets the assignment data for 1 day based on whichever day number you put into the parameters
//(days of the week start on sunday)
func getIndivAssignmentArray(assignmentArray: [[String]], dayIndex: Int) -> [String] {
    return assignmentArray[dayIndex]
}


//This returns an array that has each part of the classInfo strings separated into different strings by using the ",," dividers as separation
//The array that it returns has smaller arrays full of each individual class' data in those strings
//Setup of the array: [["class title", "assignment type", "assignment name", "date assigned"], [], [], []]
func getClassData(dayArray: [String]) -> [[String]] {
    var newArray = [[String]]()
    
    for classInfo in dayArray {
        newArray.append(classInfo.components(separatedBy: ",,"))
    }
    return newArray
}
