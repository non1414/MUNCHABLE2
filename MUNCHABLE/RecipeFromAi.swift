//
//  RecipeFromAi.swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 29/04/1445 AH.

import SwiftUI

struct RecipeStep: Identifiable {
    let id: Int
    let ingredients: [String]
    let directions: [String]
}

struct RecipeFromAi: View {
    // MARK: - Properties
    @State private var currentStep: Int = 1
    @State private var startingOffset: CGFloat = UIScreen.main.bounds.height * 0.4
    @State private var currentOffset: CGFloat = 0
    @State private var endOffset: CGFloat = 0
    
    private let steps: [RecipeStep] = [
        RecipeStep(id: 1, ingredients: ["Flour", "Baking powder", "Sugar", "Salt"], directions: [
            "Mix dry ingredients.",
            "In a small bowl, whisk together flour, sugar, baking powder, and salt, set aside.",
            "Preheat oven to 200°F.",
            "Have a baking sheet or heatproof platter ready to keep cooked pancakes warm in the oven."
        ]),
        RecipeStep(id: 2, ingredients: ["1 Large Egg", "1 Tablespoon Oil", "1 Cup Milk"], directions: [
            "Mix wet ingredients.",
            "In a medium bowl, whisk together milk, oil, and egg."
        ]),
        RecipeStep(id: 3, ingredients: ["Wet ingredients", "Dry ingredients"], directions: [
            "Add dry ingredients to milk mixture.",
            "Whisk until just moistened.",
            "Do not over mix, a few small lumps are fine."
        ]),
        RecipeStep(id: 4, ingredients: ["Skillet", "Oil"], directions: [
            "Heat a large skillet (nonstick or cast-iron) or griddle over medium heat.",
            "Fold a sheet of paper towel in half, and moisten with oil."
        ]),
        RecipeStep(id: 5, ingredients: ["Skillet", "Pancake mix"], directions: [
            "For each pancake, spoon 2 to 3 tablespoons of batter onto skillet.",
            "Cook until surface of pancakes have some bubbles and a few have burst, 1 to 2 minutes.",
            "Flip carefully with a thin spatula.",
            "Cook until browned on the underside, 1 to 2 minutes more.",
            "Serve immediately, or keep warm in oven."
        ])
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                // الخلفية
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 397, height: 329)
                            .background(
                                Image("Rectangle 76")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 397, height: 329)
                                    .clipped()
                            )
                        
                        Button(action: {
                            print("Back button tapped")
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    Spacer()
                }
                
                VStack {
                    Capsule()
                        .frame(width: 50, height: 6)
                        .foregroundColor(.gray.opacity(0.5))
                        .padding(.top, 8)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Pancake")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            HStack(spacing: 15) {
                                ForEach(steps) { step in
                                    Button(action: {
                                        currentStep = step.id
                                    }) {
                                        ZStack {
                                            Circle()
                                                .fill(step.id == currentStep ? Color.white.opacity(0.2) : Color.gray.opacity(0.1))
                                                .frame(width: 30, height: 30)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color("green"), lineWidth: 0.3)
                                                )
                                            
                                            Text("\(step.id)")
                                                .font(.system(size: 20, weight: .regular))
                                                .foregroundColor(step.id == currentStep ? Color("green") : Color.gray)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            // المكونات
                            VStack(alignment: .leading) {
                                Text("Ingredients")
                                    .font(.headline)
                                
                                ForEach(steps[currentStep - 1].ingredients, id: \.self) { ingredient in
                                    HStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 8, height: 8)
                                        Text(ingredient)
                                            .font(.body)
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Directions")
                                    .font(.headline)
                                
                                ForEach(steps[currentStep - 1].directions, id: \.self) { direction in
                                    HStack(alignment: .top) {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 8, height: 8)
                                        Text(direction)
                                            .font(.body)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    HStack(spacing: 50) {
                        if currentStep > 1 && currentStep < steps.count {
                            Button(action: {
                                currentStep -= 1
                            }) {
                                Text("Previous")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(red: 0.278, green: 0.278, blue: 0.278))
                                    .frame(width: 135, height: 41)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .shadow(color: Color.gray.opacity(0.2), radius: 1, x: 0, y: 1)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.278, green: 0.278, blue: 0.278).opacity(0.4), lineWidth: 1)
                                    )
                            }
                        }
                        
                        if currentStep == 1 {
                            Button(action: {
                                currentStep += 1
                            }) {
                                Text("Next")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 281, height: 41)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("green"))
                                    )
                                    .cornerRadius(10)
                            }
                        }
                        
                        if currentStep < steps.count && currentStep != 1 {
                            Button(action: {
                                currentStep += 1
                            }) {
                                Text("Next")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 135, height: 41)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("green"))
                                    )
                                    .cornerRadius(10)
                            }
                        }
                        
                        if currentStep == steps.count {
                            NavigationLink(destination: Make_it_()) {
                                Text("Done")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 281, height: 41)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("green"))
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 5)
                .offset(y: startingOffset)
                .offset(y: currentOffset)
                .offset(y: endOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentOffset = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentOffset < -150 {
                                    endOffset = -startingOffset
                                } else if endOffset != 0 && currentOffset > 150 {
                                    endOffset = 0
                                }
                                currentOffset = 0
                            }
                        }
                )
            }
        }
    }
}

#Preview {
    RecipeFromAi()
}
