//
//  CategorysPage.swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 30/03/1445 AH.
//
//

import SwiftUI


struct CategorysPage: View {
    // Create an array of vegetables
    let Categories = ["Vegetables", "Fruits", "Seafood", "Meats", "Poultry", "Dairy & Eggs", "Sugar & Sweeteners", "Herbs & Spices", "Baking***", "Pasta"]
    @State private var searchTerm = ""
    
    var filteredCategories: [String] {
        if searchTerm.isEmpty {
            return Categories
        } else {
            return Categories.filter { $0.lowercased().hasPrefix(searchTerm.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Choose your available ingredient !")
                    .font(Font.custom("SF Pro Text", size: 26))
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                 
                   .frame(width: 265, height: 62, alignment: .topLeading)
                   .padding(15)
                
                List(filteredCategories, id: \.self) { category in
                    HStack {
                        Image("Polygon 2")
                        
                        // .foregroundColor(Color("green"))
                        Text(category)
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                        
                        // .frame(width: 108, height: 25, alignment: .topLeading)
                        //  Vegetables
                        
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationBarTitle(" Step1")
                .searchable(text: $searchTerm, prompt: "What are you craving")
            }
        }
    }
}

#if DEBUG

#Preview {
    CategorysPage()
}
#endif
