//
//  Chooser.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/2/22.
//

import SwiftUI

struct Chooser: View {
    //MARK: - Property
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = false
    @State private var isShowingSettings: Bool = false
    var chooser: [ChooserModel] = chooserData
    
    var body: some View {
        //MARK: - Body
        ZStack{
            Color("BoardGray")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingSettings = true
                    }, label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                    })//: Button
                    .sheet(isPresented: $isShowingSettings, content: {
                        SettingsView()
                    })
                    .frame(width: 20, height: 20)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                }

                TabView{
                    ForEach(chooser[0...3]) { item in
                        ChooserCardView(chooser: item, slideNumber: item.id)
                        
                    }
                }//:Tabview
                .tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
            }
        }
    }
}

struct Chooser_Previews: PreviewProvider {
    static var previews: some View {
        Chooser(chooser: chooserData)
    }
}
