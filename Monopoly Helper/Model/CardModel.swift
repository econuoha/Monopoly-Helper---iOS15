//
//  CardModel.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

//MARK: - Card Model

struct Card: Identifiable{
    var id = UUID()
    var name: String
    var mortgageValue: Int
    var color: String
    var unmortgageValue: Int {
        return mortgageValue + ( mortgageValue / 10 )
    }
    
}
