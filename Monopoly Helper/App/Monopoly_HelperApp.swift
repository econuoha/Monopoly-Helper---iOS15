//
//  Monopoly_HelperApp.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/2/22.
//

import SwiftUI


@main
struct Monopoly_HelperApp: App {
    //MARK: - Properties
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = true
    @AppStorage("isBankruptcy") var isBankruptcy: Bool = false
    @AppStorage("isHouse") var isHouse: Bool = false
    @AppStorage("isMortgage") var isMortgage: Bool = false
    @AppStorage("isUnmortgage") var isUnmortgage: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isHomeViewActive{
                Home()
            }
            else if isBankruptcy
            {
                Bankruptcy()
            }
            else if isHouse
            {
                HouseApp()
            }
            else if isMortgage
            {
                Mortgage()
            }
            else if isUnmortgage
            {
                Unmortgage()
            }
            else
            {
                Chooser()
            }
        }
    }
}
