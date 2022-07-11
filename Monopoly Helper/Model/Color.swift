//
//  Color.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/11/22.
//

import Foundation
import SwiftUI

struct myValue: Identifiable{
    func distance(to other: myValue) -> Int {
        return 1
    }
    
    func advanced(by n: Int) -> myValue {
        return myValue(number: 0, color: .blue, name: "bro what is this")
    }
    
    typealias Stride = Int
    
    var id = UUID()
    var number: Int
    var color: Color
    var name: String
}
