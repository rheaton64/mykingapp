//
//  Sheduale.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/21/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

struct Days
{
    let aDay = [Period(Color: "Advisory", Start: 800, End: 810),
                Period(Color: "Red", Start: 810, End: 910),
                Period(Color: "Green", Start: 910, End: 1010),
                Period(Color: "Clubs/Flex", Start: 1010, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1130),
                Period(Color: "Blue", Start: 1130, End: 1250),
                Period(Color: "Purple", Start: 120, End: 215),
                Period(Color: "Tan", Start: 215, End: 315)]
    
    func GetDay(LetterDay: String) -> [Period]
    {
        switch LetterDay{
        case "A":
            return aDay
        default:
            return []
        }
    }
}


struct Period
{
    var color: String
    var start: Int
    var end: Int
    
    init( Color: String, Start: Int, End: Int) {
        start = Start
        end = End
        color = Color
    }



}
