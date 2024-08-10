//
//  ingredientsPaje.swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 29/04/1445 AH.
//

import SwiftUI

struct ingredientsPaje: View {
    
    @State private var vegetables = ["Cucumber", "Carrots", "Lettuce", "Corn"]
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Your ingredients are ")
                
                    .font(Font.custom("SF Pro Text", size: 26))
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                    .frame(width: 265, height: 62, alignment: .topLeading)
                List {
                    ForEach(vegetables, id: \.self) { vegetable in
                        
                        HStack {
                            
                            Text(vegetable)
                            
                                .font(Font.custom("SF Pro Text", size: 20))
                                .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                                .frame(width: 284, height: 30, alignment: .topLeading)
                            
                            
                            Spacer()
                            
                            if isEditing {
                                Button(action: {
                                    //       deleteVegetable(vegetable)
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.gray)
                                    
                                        .buttonStyle(BorderlessButtonStyle())
                                        .onTapGesture {
                                            if let index = vegetables.firstIndex(of: vegetable) {
                                                vegetables.remove(at: index)
                                            }
                                        }
                                }
                                
                            }
                            
                        }
                        }
                    }
                    .navigationTitle("Step2 ")
                    .navigationBarItems(trailing: Button(action: {
                        withAnimation {
                            isEditing.toggle()
                        }
                    }) {
                        if isEditing {
                            Text("Done")
                        } else {
                            Text("Edit")
                                .font(Font.custom("Inter", size: 20))
                                .frame(width: 40, height: 20, alignment: .topLeading)
                                .foregroundColor(Color("green"))
                        }
                    })
                    .environment(\.editMode, Binding.constant(isEditing ? .active : .inactive))
                    
                }
                
                
            .listStyle(.plain)
        
                .overlay(
                    Button(action: {
                        // Action to perform when the "Start" button is tapped
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 281, height: 41)
                                .background(Color(red: 0.33, green: 0.71, blue: 0.45))
                                .cornerRadius(8)
                            
                            Text("Make it")
                                .font(
                                    Font.custom("SF Pro Text", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .background(Color("green"))
                            
                        }
                    }
                        .padding(.bottom, 16)
                )}
        
    }
}

#Preview {
    ingredientsPaje()
}

