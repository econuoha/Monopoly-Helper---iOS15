//
//  SettingsView.swift
//  Fruits
//
//  Created by Emmanuel Onouha on 7/5/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = false
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20){
                    //MARK: - Section 1
                    
                    GroupBox(label:
                                SettingsLabelView(labelText: "Monopoly Helper", labelImage: "info.circle"))
                    {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("monopolyMan")
                                .resizable()
                                .scaledToFit().frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Monopoly, real-estate board game for two to eight players, in which the player’s goal is to remain financially solvent while forcing opponents into bankruptcy by buying and developing pieces of property.")
                                .font(.footnote)
                        }
                    }
                    
                    //MARK: - Section 2
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ){
                        Divider().padding(.vertical, 4)
                        Text("To restart the application toggle the switch in this box. It will restart the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isHomeViewActive){
                            if isHomeViewActive {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    //MARK: - Section 3
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ){
                        
                        
                        SettingsRowView(name: "Developer", content: "Emmanuel Onuoha")
                        SettingsRowView(name: "Inspiration", content: "Alex Atiyota")
                        SettingsRowView(name: "Compatibility", content: "iOS 15+")
                        SettingsRowView(name: "Website", linkLabel: "Emmanuel Portfolio", linkDestination: "econuoha.github.io")
                        SettingsRowView(name: "Rules", linkLabel: "Monopoly Rules", linkDestination: "howdoyouplayit.com/monopoly-rules-play-monopoly/")
                        SettingsRowView(name: "SwiftUI", content: "5.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }//:Box
                }//:VStack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action:{
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }//:ScrollView
        }//: Navigation
    }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
