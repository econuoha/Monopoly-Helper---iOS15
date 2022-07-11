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

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ContentView: View {
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
          TextField("Enter some text ...", text: $text)
        }.onTapGesture {
          self.hideKeyboard()
        }
    }
}
