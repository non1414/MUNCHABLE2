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
        NavigationView {
            TabView(selection: $currentPage) {
                ForEach(0..<onboardingData.count) { index in
                    OnboardingPageView(onboardingItem: onboardingData[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarHidden(true)
            
            VStack {
                Spacer()
                HStack {
                    if currentPage > 0 {
                        Button("Previous") {
                            currentPage -= 1
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    if currentPage == onboardingData.count - 1 {
                        Button("Get Started") {
                            // Handle the action when the user wants to start using the app
                        }
                        .padding()
                    } else {
                        Button("Next") {
                            currentPage += 1
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct OnboardingPageView: View {
    let onboardingItem: OnboardingItem
    
    var body: some View {
        VStack {
            Image(onboardingItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text(onboardingItem.title)
                .font(.title)
                .padding()
            
            Text(onboardingItem.description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct OnboardingItem {
    let imageName: String
    let title: String
    let description: String
}

let onboardingData: [OnboardingItem] = [
    OnboardingItem(imageName: "onboarding_image_1", title: "Latest Technologies", description: "Use Make it to explore an inspiring recipes to add a little fun to your dinner table by using AI "),
    OnboardingItem(imageName: "onboarding_image_2", title: "Get Inspired", description: "Don’t know what to eat? we’ll suggest things to cook with the ingredients you have"),
  
]

