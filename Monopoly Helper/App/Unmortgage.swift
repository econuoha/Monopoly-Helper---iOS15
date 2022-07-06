//
//  Unmortgage.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

struct Unmortgage: View {
    //MARK: - Properties
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = false
    @AppStorage("isUnmortgage") var isUnmortgage: Bool = true
    
    //MARK: - Body
    var body: some View {
        Text("Unmortgage")
        Button {
            isUnmortgage = false
        } label: {
            Text("Back")
        }
    }
}

//MARK: - Preview
struct Unmortgage_Previews: PreviewProvider {
    static var previews: some View {
        Unmortgage()
    }
}
