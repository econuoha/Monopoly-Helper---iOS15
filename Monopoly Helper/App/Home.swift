//
//  ContentView.swift
//  Monopoly Helper
//
//  Created by Emmanuel Onouha on 7/2/22.
//

import SwiftUI

struct Home: View {
    //MARK: - Properties
    
    @AppStorage("isHomeViewActive") var isHomeViewActive: Bool = true
    @State private var isAnimating: Bool = false
    @State private var homeImage: String = "monopolyMan"
    @State private var buttonOffset: CGFloat = 0
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    
    
    var body: some View {

            ZStack {
                Color("BoardGray")
                    .ignoresSafeArea()
            
                VStack{
                    //MARK: - Header
                    Image(homeImage)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .frame(width: 300, height: 300, alignment: .center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 8, x: 6, y: 8)
                    Spacer()
                    
                    //MARK: - Center/Instructions
                    Text("Instructions:")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("""
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla.
                        """)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                        .font(.title3)

                    Spacer()
                    
                    //MARK: - Footer
                    ZStack{
                        
                        //Parts of button
                        
                        //1. Background(static)
                        
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .padding(8)
                        
                        //2. Call-To-Action (static)
                        
                        Text("Get Started")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .offset(x: 20)
                        
                        //3. Capsule (dynamic width)
                        
                        HStack{
                            Capsule()
                                .fill(Color("LogoDarkGreen"))
                                .frame(width: buttonOffset + 80)
                            
                            Spacer()
                        }
                        
                        
                        //4. Circle (Draggable)
                        
                        HStack {
                            ZStack{
                                
                                Circle()
                                    .fill(Color("LogoDarkGreen"))
                                Circle()
                                    .fill(.black.opacity(0.15))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    
                            }
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        if gesture.translation.width > 0 && gesture.translation.width < buttonWidth - 80{
                                            buttonOffset = gesture.translation.width
                                        }
                                        withAnimation (Animation.easeOut(duration: 0.4)){
                                            homeImage = "monopolyManHat"
                                        }
                                    }
                                    .onEnded({ _ in
                                        
                                        withAnimation(Animation.easeOut(duration: 0.4)){
                                            if buttonOffset > buttonWidth / 2{
                                                buttonOffset = buttonWidth - 80
                                                isHomeViewActive = false
                                            } else {
                                                homeImage = "monopolyMan"
                                                buttonOffset = 0
                                            }
                                        }
                                        
                                    })
                            )//: Gesture
                            Spacer()
                        }
                        
                        
                    }// : Footer
                    .frame(width: buttonWidth, height: 80,
                           alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                }//: VStack
                
                
            }//:ZStack
            .onAppear{
                isAnimating = true
            }
        
    }//:Body
}//:Struct

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
