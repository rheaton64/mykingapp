//
//  jsonDataSch.swift
//  mykingapp
//
//  Created by Ryan Heaton on 5/13/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

func getDataFromServer(studentFName: String, studentLName: String, studentGrade: String) -> schData {
    
    var output = schData(name: "", schedule: [[]], isFirstLunch: [])
    
    guard let serverURL = URL(string: "http://10.0.1.200:5000/get/testsch/\(studentLName)%2C%20\(studentFName)%20%27\(studentGrade)") else { fatalError("URL not found") }
    
    let request = URLRequest(url: serverURL)
    
    let task = URLSession.shared.dataTask(with: request, completionHandler:
    { (data, response, error) -> Void in
        
        if let data = data {
            //this assigns the studentArray variable (made a private variable outside) to what parseJsonData returns
            
            output = parseJsonData(data: data)
            
        }
        if let error = error {
            print(error)
            return
        }
    })
    task.resume()
    return output
}

func parseJsonData(data: Data) -> schData {
    let decoder = JSONDecoder()
    
    var schVals = schData(name: "", schedule: [[]], isFirstLunch: [])
    
    do {
        let output = try decoder.decode(schData.self, from: data)
        
        schVals = output.self
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
        case isFistLunch = "isFirstLunch"
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        schedule = try values.decode([[String]].self, forKey: .schedule)
        isFirstLunch = try values.decode([Bool].self, forKey: .isFistLunch)
    }
    
    init(name: String, schedule: [[String]], isFirstLunch: [Bool]) {
        self.name = name
        self.schedule = schedule
        self.isFirstLunch = isFirstLunch
    }
}
