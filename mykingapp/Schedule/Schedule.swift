//
//  Sheduale.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/21/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

//need this

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
    let aDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Red", Start: 810, End: 910),
                Period(Color: "Green", Start: 910, End: 1010),
                Period(Color: "Grey", Start: 1010, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1130),
                Period(Color: "Blue", Start: 1130, End: 1320),
                Period(Color: "Purple", Start: 1320, End: 1415),
                Period(Color: "Tan", Start: 1415, End: 1515)]
    
    let bDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Pink", Start: 810, End: 910),
                Period(Color: "Orange", Start: 910, End: 1010),
                Period(Color: "Grey", Start: 1010, End: 1035),
                Period(Color: "Red", Start: 1035, End: 1130),
                Period(Color: "Green", Start: 1130, End: 1320),
                Period(Color: "Blue", Start: 1320, End: 1415),
                Period(Color: "Purple", Start: 1415, End: 1515)]
    
    let cDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Green", Start: 810, End: 905),
                Period(Color: "Tan", Start: 905, End: 1000),
                Period(Color: "Grey", Start: 1000, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1130),
                Period(Color: "Pink", Start: 1130, End: 1320),
                Period(Color: "Red", Start: 1320, End: 1415),
                Period(Color: "Orange", Start: 1415, End: 1515)]
    
    let dDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Blue", Start: 810, End: 905),
                Period(Color: "Purple", Start: 905, End: 1000),
                Period(Color: "Grey", Start: 10100, End: 1025),
                Period(Color: "Yellow", Start: 1025, End: 1130),
                Period(Color: "Tan", Start: 1130, End: 1320),
                Period(Color: "Pink", Start: 1320, End: 1415),
                Period(Color: "Orange", Start: 1415, End: 1515)]
    
    let eDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Green", Start: 810, End: 905),
                Period(Color: "Red", Start: 905, End: 1000),
                Period(Color: "Grey", Start: 1000, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1135),
                Period(Color: "Purple", Start: 1130, End: 1320),
                Period(Color: "Blue", Start: 1320, End: 1415),
                Period(Color: "Tan", Start: 1415, End: 1515)]
    
    let fDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Orange", Start: 810, End: 910),
                Period(Color: "Pink", Start: 910, End: 1010),
                Period(Color: "Grey", Start: 1010, End: 1035),
                Period(Color: "Green", Start: 1035, End: 1130),
                Period(Color: "Red", Start: 1130, End: 1320),
                Period(Color: "Purple", Start: 1320, End: 1415),
                Period(Color: "Blue", Start: 1415, End: 1515)]
    
    let gDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Tan", Start: 810, End: 900),
                Period(Color: "Grey", Start: 900, End: 945),
                Period(Color: "Pink", Start: 945, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1130),
                Period(Color: "Orange", Start: 1130, End: 1320),
                Period(Color: "Green", Start: 1320, End: 1415),
                Period(Color: "Red", Start: 1415, End: 1515)]
    
    let hDay = [Period(Color: "Grey", Start: 800, End: 810),
                Period(Color: "Purple", Start: 810, End: 910),
                Period(Color: "Blue", Start: 910, End: 1010),
                Period(Color: "Grey", Start: 1010, End: 1035),
                Period(Color: "Yellow", Start: 1035, End: 1130),
                Period(Color: "Tan", Start: 1130, End: 1320),
                Period(Color: "Orange", Start: 1320, End: 1415),
                Period(Color: "Pink", Start: 1415, End: 1515)]
    
    // you can reguest to get the array of a specific day
    func GetDay(LetterDay: String) -> [Period]
    {
        switch LetterDay{
        case "A":
            return aDay
        case "B":
            return bDay
        case "C":
            return cDay
        case "D":
            return dDay
        case "E":
            return eDay
        case "F":
            return fDay
        case "G":
            return gDay
        case "H":
            return hDay
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





//run while you still can
