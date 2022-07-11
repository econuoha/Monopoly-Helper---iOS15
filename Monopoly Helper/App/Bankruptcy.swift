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
    
    @FocusState private var nameIsFocused: Bool
    
    @State private var moneyAmount = ""
    
    @State private var cashOnHand = ""
    
    @State var cards: [Card] = cardData
    
    @State var houses: [House] = bankruptHousingData
    
    @State var monopolyColor = "LogoDarkRed"
    
    let step = 1
    let range = 0...15
    
    //MARK: - Body
    var body: some View {
        ZStack {
            ScrollView {
                Section{
                    Text("Rent")
                        .padding(.top)
                        .foregroundColor(.gray)
                    TextField("Amount you need to pay",text: $moneyAmount)
                        .padding(.horizontal)
                        .focused($nameIsFocused)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.oneTimeCode)
                    
                    Text("Cash")
                        .padding(.top)
                        .foregroundColor(.gray)
                    
                    TextField("Cash on hand",text: $cashOnHand)
                        .padding(.horizontal)
                        .focused($nameIsFocused)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.oneTimeCode)
                    
                    Button("Submit") {
                        nameIsFocused = false
                    }
                    .foregroundColor(Color("BoardDarkBlue"))
                    Section{
                        if let safeMoneyAmount = Int(moneyAmount){
                            if let safeCashOnHand = Int(cashOnHand){
                                let temp = calculateEverything(moneyAmount: safeMoneyAmount, cashOnHand: safeCashOnHand, houseValues: houses, cardValues: cards)
                                Text(temp.text)
                                    .background(
                                        Color(temp.color)
                                    )
                                    .font(.largeTitle)
                                    .padding()
                            }
                        }
                        
                    }
                }
                
                
                Text("Cards")
                    .padding(.top)
                    .foregroundColor(.gray)
                Section{
                    ScrollView{
                        VStack {
                            ForEach($cards) { $card in
                                Toggle(card.name, isOn: $card.isOn)
                                    .font(.title)
                                    .toggleStyle(.button)
                                    .tint(Color(card.color))
                            }
                        }
                    }
                }
                .padding()
                .frame(height: 200)
                Text("Houses")
                    .padding(.top)
                    .foregroundColor(.gray)
                Section{
                    ScrollView{
                        ForEach($houses){$value in
                            HStack {
                                Text(String(value.number))
                                Spacer()
                                Stepper(value.type, value: $value.number,
                                                in: range,
                                        step: step)
                            }
                            
                            
                        }
                    }
                }
                .padding()
                .frame(height: 200)
                Spacer()
                
                
                Button {
                    isBankruptcy = false
                } label: {
                    Text("Back")
                        .foregroundColor(Color("BoardDarkBlue"))
                        .background(
                            Capsule()
                        )
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
        }
        
    }
}

//MARK: - Preview
struct Bankruptcy_Previews: PreviewProvider {
    static var previews: some View {
        Bankruptcy()
    }
}

func calculateEverything(moneyAmount:Int, cashOnHand: Int, houseValues: [House], cardValues: [Card]) -> SorB{
    
    var valueToReturn = moneyAmount
    
    valueToReturn -= cashOnHand
    
    for item in houseValues{
        valueToReturn -= item.houseMortgagePrice * item.number
    }
    
    for item in cardValues{
        if item.isOn{
            valueToReturn -= item.mortgageValue
        }
    }
    
    
    return SorB(text: String(valueToReturn))
}
