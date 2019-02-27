//
//  Sheduale.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/21/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

//the structer of a period containing color start time and end time
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

struct Days
{
    //all of the day scheduales
    let aDay = [Period(Color: "grey", Start: 800, End: 810),
                Period(Color: "red", Start: 810, End: 910),
                Period(Color: "green", Start: 910, End: 1010),
                Period(Color: "grey", Start: 1010, End: 1035),
                Period(Color: "yellow", Start: 1035, End: 1130),
                Period(Color: "blue", Start: 1130, End: 1250),
                Period(Color: "purple", Start: 1320, End: 1415),
                Period(Color: "tan", Start: 1415, End: 1515)]
    
    // you can reguest to get the array of a specific day
    func GetDay(LetterDay: String) -> [Period]
    {
        switch LetterDay{
        case "A":
            return aDay
        default:
            return []
        }
    }
    //by gininf the current time in 24 hour time ie 2:30 = 1430 it will give you the current period array
    func GetPeriod (time: Int) -> Int{
        let day = Days()
        let Letter = "A" // temp
        let schedule = day.GetDay(LetterDay: Letter)
        var period = 0
        
        if time < schedule[0].start{
            period = 0
        }
        else if time >= schedule[0].start && time <= schedule[0].end{
            period = 0
        }
        else if time >= schedule[1].start && time <= schedule[1].end{
            period = 1
        }
        else if time >= schedule[2].start && time <= schedule[2].end{
            period = 2
        }
        else if time >= schedule[3].start && time <= schedule[3].end{
            period = 3
        }
        else if time >= schedule[4].start && time <= schedule[4].end{
            period = 4
        }
        else if time >= schedule[5].start && time <= schedule[5].end{
            period = 5
        }
        else if time >= schedule[6].start && time <= schedule[6].end{
            period = 6
        }
        else if time >= schedule[7].start && time <= schedule[7].end{
            period = 7
        }
        else if time > schedule[7].end{
            period = 0
        }
        return period
    }
    
    
    
}

