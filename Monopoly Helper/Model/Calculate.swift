//
//  Calculate.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/11/22.
//

import Foundation

struct SorB{
    var text: String
    var numText: Int{
        return Int(text)!
    }
    var color: String{
        return numText > 0 ? "LogoDarkRed" : "LogoDarkGreen"
    }
}
