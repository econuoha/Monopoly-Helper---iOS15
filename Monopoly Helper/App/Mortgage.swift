//
//  Mortgage.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

struct Mortgage: View {
    //MARK: - Properties
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = false
    @AppStorage("isMortgage") var isMortgage: Bool = true
    
    //MARK: - Body
    var body: some View {
        Text("Mortgage")
        Button {
            isMortgage = false
        } label: {
            Text("Back")
        }
    }
}

//MARK: - Preview
struct Mortgage_Previews: PreviewProvider {
    static var previews: some View {
        Mortgage()
    }
}
