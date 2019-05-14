//
//  jsonDataSch.swift
//  mykingapp
//
//  Created by Ryan Heaton on 5/13/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

func getSchDataFromServer(fName: String, lName: String, grade: Int) {
    
    var output = schData(name: "", schedule: [[]], isFirstLunch: [])
    
    guard let serverURL = URL(string: "http://10.0.1.200:5000/get/testsch/\(lName)%2C%20\(fName)%20%27\(grade)") else { fatalError("URL not found") }
    
    let request = URLRequest(url: serverURL)
    
    let task = URLSession.shared.dataTask(with: request, completionHandler:
    { (data, response, error) -> Void in
        
        if let data = data {
            output = parseJsonData(data: data)
            ScheduleData.scheduleJsonData = output
            
        }
        if let error = error {
            print(error)
            return
        }
    })
    task.resume()
}

func parseJsonData(data: Data) -> schData {
    let decoder = JSONDecoder()
    
    var schVals = schData(name: "", schedule: [[]], isFirstLunch: [])
    
    do {
        let output = try decoder.decode(schData.self, from: data)
        //print(output)
        schVals = output
    } catch {
        print(error)
    }
    
    return schVals
    
}

struct schData: Decodable{
    var name: String
    var schedule: [[String]]
    var isFirstLunch: [Bool]
    
    enum CodingKeys: String, CodingKey {
        case name = "student_name"
        case schedule = "schedule"
        case isFirstLunch = "isFirstLunch"
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        schedule = try values.decode([[String]].self, forKey: .schedule)
        isFirstLunch = try values.decode([Bool].self, forKey: .isFirstLunch)
    }
    
    init(name: String, schedule: [[String]], isFirstLunch: [Bool]) {
        self.name = name
        self.schedule = schedule
        self.isFirstLunch = isFirstLunch
    }
}

class ScheduleData {
    static var scheduleJsonData: schData?
    
    static func getScheduleData(fName: String, lName: String, grade: Int) -> schData {
        if let scheduleJsonData = scheduleJsonData {
            return scheduleJsonData
        }
        getSchDataFromServer(fName: fName, lName: lName, grade: grade)
        while scheduleJsonData == nil {}
        return scheduleJsonData!
        
    }
}
