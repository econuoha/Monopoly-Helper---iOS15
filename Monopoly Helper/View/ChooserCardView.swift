//
//  FruitCardView.swift
//  Fruits
//
//  Created by Emmanuel Onouha on 7/5/22.
//

import SwiftUI

struct ChooserCardView: View {
    //MARK: - Properties
    
    @State private var isAnimating: Bool = false
    var chooser: ChooserModel
    var slideNumber: Int
    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //Fruit: Image
                Image(chooser.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 10)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                //Fruit: Title
                Text(chooser.title)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                //Fruit: Headline
                Text(chooser.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                // Button: Start
                StartButtonView(actionNumber: slideNumber)
            } //: VStack
        }//: ZStack
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: chooser.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
}

//MARK: - Preview
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChooserCardView(chooser: chooserData[0], slideNumber: 0)
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
