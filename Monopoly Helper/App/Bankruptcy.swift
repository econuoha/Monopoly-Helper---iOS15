//
//  Bankruptcy.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/6/22.
//

import SwiftUI

struct Bankruptcy: View {
    //MARK: - Properties
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = false
    @AppStorage("isBankruptcy") var isBankruptcy: Bool = true
    
    //MARK: - Body
    var body: some View {
        Text("Bankruptcy")
        Button {
            isBankruptcy = false
        } label: {
            Text("Back")
        }

    }
}
//MARK: - Preview
struct Bankruptcy_Previews: PreviewProvider {
    static var previews: some View {
        Bankruptcy()
    }
}
