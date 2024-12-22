////
////  Onboarding.swift
////  MUNCHABLE
////
////  Created by نوف بخيت الغامدي on 24/03/1445 AH.

//import SwiftUI
//
//struct Onboarding: View {
//    
//    @State private var currentPage = 0
//    
//    var body: some View {
//        NavigationStack { // استخدام NavigationStack لتفعيل التنقل بين الصفحات
//            VStack {
//                // Skip Button
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        currentPage = onboardingData.count - 1
//                    }) {
//                        Text("Skip")
//                            .font(Font.custom("Inter", size: 20))
//                            .foregroundColor(Color(red: 0.33, green: 0.71, blue: 0.45))
//                            .frame(width: 41, height: 26, alignment: .topLeading)
//                    }
//                    .padding()
//                }
//                
//                // Display Pages
//                TabView(selection: $currentPage) {
//                    ForEach(0..<onboardingData.count, id: \.self) { index in
//                        VStack(spacing: 20) {
//                            Spacer()
//                            
//                            Image(onboardingData[index].imageName)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 150, height: 150)
//                            
//                            Text(onboardingData[index].title)
//                                .font(Font.custom("SF Pro Text", size: 36))
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
//                            
//                            Text(onboardingData[index].description)
//                                .font(Font.custom("SF Pro Text", size: 20))
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
//                                .frame(width: 335, height: 78, alignment: .top)
//                            
//                            Spacer()
//                            
//                            // Page Indicator
//                            HStack(spacing: 8) {
//                                ForEach(0..<onboardingData.count, id: \.self) { dotIndex in
//                                    Circle()
//                                        .strokeBorder(
//                                            dotIndex == currentPage
//                                            ? Color("green")
//                                            : Color(UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)),
//                                            lineWidth: 2
//                                        )
//                                        .background(
//                                            Circle()
//                                                .fill(dotIndex == currentPage ? Color("green") : Color.clear)
//                                        )
//                                        .frame(width: 12, height: 12)
//                                }
//                            }
//                            
//                            // Start Button on Last Page
//                            if index == onboardingData.count - 1 {
//                                NavigationLink(destination: Make_it_()) { // التنقل إلى الصفحة Make_it_
//                                    Text("Start")
//                                        .font(.headline)
//                                        .frame(maxWidth: .infinity)
//                                        .padding()
//                                        .foregroundColor(.white)
//                                        .background(Color("green"))
//                                        .cornerRadius(8)
//                                        .padding(.horizontal, 50)
//                                }
//                            }
//                        }
//                        .tag(index)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            }
//            .background(Color.white.edgesIgnoringSafeArea(.all))
//        }
//    }
//}
//
//// بيانات صفحة Onboarding
//struct OnboardingData {
//    let imageName: String
//    let title: String
//    let description: String
//}
//
//let onboardingData = [
//    OnboardingData(imageName: "ai_icon", title: "Latest Technologies", description: "Use Make it to explore inspiring recipes to add a little fun to your dinner table by using AI."),
//    OnboardingData(imageName: "recipe_icon", title: "Get Inspired!", description: "Don’t know what to eat? we’ll suggest things to cook with the ingredients you have.")
//]
//
//// صفحة Make_it_
//
//#Preview {
//    Onboarding()
//}
import SwiftUI

struct Onboarding: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: Make_it_()) {
                        Text(NSLocalizedString("Skip", comment: ""))
                            .font(Font.custom("Inter", size: 20))
                            .foregroundColor(Color(red: 0.33, green: 0.71, blue: 0.45))
                            .frame(width: 41, height: 26, alignment: .topLeading)
                    }
                    .padding()
                }
                
                // Display Pages
                TabView(selection: $currentPage) {
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        VStack(spacing: 20) {
                            Spacer()
                            
                            Image(onboardingData[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                            Text(NSLocalizedString(onboardingData[index].title, comment: ""))
                                .font(Font.custom("SF Pro Text", size: 36))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                            
                            Text(NSLocalizedString(onboardingData[index].description, comment: ""))
                                .font(Font.custom("SF Pro Text", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                .frame(width: 335, height: 78, alignment: .top)
                            
                            Spacer()
                            
                            // Page Indicator
                            HStack(spacing: 8) {
                                ForEach(0..<onboardingData.count, id: \.self) { dotIndex in
                                    Circle()
                                        .strokeBorder(
                                            dotIndex == currentPage
                                            ? Color("green")
                                            : Color(UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1)),
                                            lineWidth: 2
                                        )
                                        .background(
                                            Circle()
                                                .fill(dotIndex == currentPage ? Color("green") : Color.clear)
                                        )
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            if index == onboardingData.count - 1 {
                                NavigationLink(destination: Make_it_()) {
                                    Text(NSLocalizedString("Start", comment: ""))
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color("green"))
                                        .cornerRadius(8)
                                        .padding(.horizontal, 50)
                                }
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct OnboardingData {
    let imageName: String
    let title: String
    let description: String
}

let onboardingData = [
    OnboardingData(imageName: "ai_icon", title: "Latest Technologies", description: "Use Make it to explore inspiring recipes to add a little fun to your dinner table by using AI."),
    OnboardingData(imageName: "recipe_icon", title: "Get Inspired!", description: "Don’t know what to eat? we’ll suggest things to cook with the ingredients you have.")
]


#Preview {
    Onboarding()
}
