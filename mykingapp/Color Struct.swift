//
//  Color Struct.swift
//  mykingapp
//
//  Created by Spencer Creveling on 2/21/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import Foundation

struct Colors {
    var tan = [0.8196, 0.6627, 0.4588, 1.0] // #d1a975 tan
    var blue = [0, 0.2118, 0.9176, 1.0]// #0036ea blue
    var red = [0.898, 0, 0.0118, 1.0]// #e50003 red
    var green = [0, 0.8392, 0.0275, 1.0] // #00d607 green
    var yellow = [1, 0.8157, 0, 1.0] // #ffd000 yellow
    var purple = [0.3333, 0.102, 0.5451, 1.0] // #551a8b purple
    var pink = [1, 0.0784, 0.5765, 1.0] // #ff1493 pink
    var orange = [1, 0.6824, 0.098, 1.0] // #ffae19 orange
    var grey = [0.502, 0.502, 0.502, 1.0] /* #808080 */
    
    func GetColor(color: String, RGBA: Int) -> Double
    {
        let colors = Colors()
        switch color {
        case "tan":
            return colors.tan[RGBA]
        case "blue":
            return colors.blue[RGBA]
        case "red":
            return colors.red[RGBA]
        case "green":
            return colors.green[RGBA]
        case "yellow":
            return colors.yellow[RGBA]
        case "purple":
            return colors.purple[RGBA]
        case "pink":
            return colors.pink[RGBA]
        case "orange":
            return colors.orange[RGBA]
        case "grey":
            return colors.grey[RGBA]
        
        default: return 0
            
        }
    }
}


