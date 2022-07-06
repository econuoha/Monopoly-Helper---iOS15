//
//  StartButtonView.swift
//  Fruits
//
//  Created by Emmanuel Onouha on 7/5/22.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - Properties
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool?
    
    @AppStorage("isBankruptcy") var isBankruptcy: Bool?
    @AppStorage("isHouse") var isHouse: Bool?
    @AppStorage("isMortgage") var isMortgage: Bool?
    @AppStorage("isUnmortgage") var isUnmortgage: Bool?
    
    var actionNumber: Int
    
    //MARK: - Body
    var body: some View {
        Button(action:{
            //Go to whatever
            switch actionNumber {
            case 0:
                isBankruptcy = true
            case 1:
                isHouse = true
            case 2:
                isMortgage = true
            case 3:
                isUnmortgage = true
            default:
                print("Something went wrong.")
            }
            isHomeViewActive = false
        }) {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )//:Background
        }//: Button
        .accentColor(.white)

    }
}

//MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(actionNumber: 0)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
