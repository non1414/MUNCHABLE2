//
//
//  ingredientsPaje.swift
//  MUNCHABLE
//
// Created by نوف بخيت الغامدي on 29/04/1445 AH.
import SwiftUI

struct IngredientsPage: View {
    @Binding var selectedIngredients: [String]
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("Your ingredients are")
                        .font(Font.custom("SF Pro Text", size: 26))
                        .padding()
                    
                    List {
                        ForEach(selectedIngredients, id: \.self) { ingredient in
                            HStack {
                                Text(ingredient)
                                    .font(Font.custom("SF Pro Text", size: 18))
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                if isEditing {
                                    Button(action: {
                                        deleteIngredient(ingredient)
                                    }) {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                    
                    NavigationLink(destination: LoadingRecipesPage()) {
                        Text("Make it")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("green"))
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
                .padding(.top, 10)
            }
            .navigationBarTitle("Step 2", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                isEditing.toggle()
            }) {
                Text(isEditing ? "Done" : "Edit")
                    .foregroundColor(Color("green"))
                    .font(.headline)
            })
        }
    }
    
    // حذف مكون
    private func deleteIngredient(_ ingredient: String) {
        selectedIngredients.removeAll { $0 == ingredient }
    }
}

