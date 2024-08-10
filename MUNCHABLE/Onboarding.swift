//
//  Onboarding.swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 24/03/1445 AH.
//

import SwiftUI

struct Onboarding: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    // Skip button action
                    currentPage = 2  // Go to the last page (or adjust as needed)
                }
            })  {
                HStack{
                    Spacer()
                    Text("Skip")
                        .foregroundColor(.green)
                    
                        .font(Font.custom("Inter", size: 20))
                    
                        .frame(width: 41, height: 26, alignment: .topLeading)
                }
            }
            TabView(selection: $currentPage) {
                OnboardingPageView(imageName: "onboarding1", title: "Latest Technologies", description: "Use Make it to explore an inspiring recipes to add a little fun to your dinner table by using AI.")
                    .tag(0)
                
                OnboardingPageView(imageName: "onboarding2", title: "Get Inspired", description: "Don’t know what to eat? we’ll suggest things to cook with the ingredients you have.")
                    .tag(1)
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .padding()
            
            HStack(spacing: 10) {
                ForEach(0..<2) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(index == currentPage ? .white : .green)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .padding(.vertical, 8)
                }
            }
            Button {
            } label: {
                Text("Start")
                    .font(
                        Font.custom("SF Pro Text", size: 16)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 281, height: 41)
                    .foregroundColor(.white)
                    .background(Color("green"))
                // .background(Color("Color 3"))
                    .cornerRadius(8)
                
            }
            
        }
        .padding()
    }
}


struct OnboardingPageView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
           // Image("PathImage")
            Rectangle()
              .foregroundColor(.clear)
             // .frame(width: 256, height: 256)
              .background(
                Image("PathImage")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 256, height: 256)
                  .clipped()
              )
            
            Text(title)
                .font(Font.custom("SF Pro Text", size: 36))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
            
            Text(description)
                .font(Font.custom("SF Pro Text", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                .frame(width: 335, height: 78, alignment: .top)
        }
    }
}
#Preview {
    Onboarding()
}
