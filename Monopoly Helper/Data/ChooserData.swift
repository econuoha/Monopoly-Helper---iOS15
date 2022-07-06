//
//  ChooserData.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

//MARK: - Chooser Data

let chooserData : [ChooserModel]  = [
    ChooserModel(id: 0, title: "Bankruptcy Calculator", headline: "Rent is getting a bit expensive. Let's see if we have the funds to pay it off.", image: "PayItOff",
                 gradientColors: [Color("BoardRed"), Color("LogoDarkRed")])
                 ,
    ChooserModel(id: 1, title: "House Calculator", headline: "Time to build some firepower. Let's see how many houses we can build.", image: "HouseCalculator",gradientColors: [Color("LogoLightGreen"), Color("LogoDarkGreen")])
                 ,
    ChooserModel(id: 2, title: "Mortgage Calculator", headline: "Money is looking a bit tight. Let's see how much money we can get from the bank.", image: "Mortgage",
                 gradientColors: [Color("BoardLightBlue"), Color("BoardDarkBlue")]),
    ChooserModel(id: 3, title: "Un-Mortgage Calculator", headline: "Money is looking good. Let's see how much it will cost to bring some property back into the game.", image: "Unmortgage",
                 gradientColors: [Color("LogoLightBrown"), Color("BoardBrown")])
]
