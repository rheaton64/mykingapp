//
//  jsonData.swift
//  mykingapp
//
//  Created by Ryan Heaton on 5/12/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

func getLetterFromServer(){
    var letterDayToReturn: String?
    guard let serverURL = URL(string: "http://10.0.1.200:5000/get/letterday") else { fatalError("URL not found") }
    
    let task = URLSession.shared.dataTask(with: serverURL, completionHandler: {(data, response, error) in
        if let data = data {
            if let objData = try? JSONSerialization.jsonObject(with: data, options:.allowFragments) {
                if let dict = objData as? [String: Any] {
                    letterDayToReturn = dict["letter"] as? String
                    Letter.letterDay = letterDayToReturn
                }
            }
        }
        else   {
            print(error)
        }

    })
    task.resume()
}

class Letter{
    static var letterDay: String?
    
    static func getLetterDay() -> String {
        if let letterDay = letterDay {
            return letterDay
        }
        getLetterFromServer()
        while letterDay == nil {}
        print(letterDay!)
        return letterDay!
        
        
    }
    
    
}
