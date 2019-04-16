//
//  Schedule Decode.swift
//  mykingapp
//
//  Created by Spencer Creveling on 3/28/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//10.0.1.200:5000/get/testsch/Creveling%spencer%20

import Foundation
struct ClassStuff: Codable
{
    var student_name: String
    var schedule: [String]
enum CodingKeys : String, CodingKey {
    case student_name
    case schedule
    }

init (from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    student_name = try values.decode(String.self, forKey: .student_name)
    schedule = try values.decode([String].self, forKey: .schedule)
    }
}
