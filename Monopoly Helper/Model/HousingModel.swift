//
//  HousingModel.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

//MARK: - Housing Model

struct House: Identifiable{
    var id = UUID()
    var type: String
    var housePrice: Int
    var color: String
    var houseMortgagePrice : Int {
        return housePrice / 2
    }
}
