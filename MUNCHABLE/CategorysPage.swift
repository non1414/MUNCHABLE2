//
//  CategorysPage.swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 30/03/1445 AH.
//
import SwiftUI

struct CategorysPage: View {
    @State private var categories: [String: [String]] = [
        "Vegetables": ["Cucumber", "Corn", "Carrots", "Lettuce", "Garlic", "Tomatoes"],
        "Fruits": ["Apple", "Banana", "Orange"],
        "Seafood": ["Shrimp", "Salmon", "Tuna"],
        "Meats": ["Beef", "Chicken", "Lamb"],
        "Poultry": ["Eggs", "Turkey"],
        "Dairy & Eggs": ["Milk", "Cheese", "Butter"],
        "Sugar & Sweeteners": ["Sugar", "Honey", "Stevia"],
        "Herbs & Spices": ["Basil", "Cinnamon", "Pepper"],
        "Baking***": ["Flour", "Yeast", "Baking Powder"],
        "Pasta": ["Spaghetti", "Penne", "Fettuccine"]
    ]
    
    @State private var searchTerm = ""
    @State private var expandedCategory: String?
    @State private var selectedIngredients: [String] = []
    @State private var isSearching = false // تتبع حالة البحث
    
    var filteredCategories: [(String, [String])] {
        categories
            .map { (category, items) in
                let filteredItems = items.filter {
                    guard !searchTerm.isEmpty else { return true }
                    return $0.lowercased().hasPrefix(searchTerm.lowercased())
                }
                return (category, filteredItems)
            }
            .filter { !$0.1.isEmpty || searchTerm.isEmpty }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(NSLocalizedString("choose_ingredient_title", comment: ""))
                    .font(Font.custom("SF Pro Text", size: 26))
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                HStack(spacing: 10) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField(
                            NSLocalizedString("search_placeholder", comment: ""),
                            text: $searchTerm,
                            onEditingChanged: { isEditing in
                                withAnimation {
                                    isSearching = isEditing
                                }
                            }
                        )
                        .font(Font.custom("SF Pro Text", size: 16))
                        .foregroundColor(.gray)
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    if isSearching {
                        Button(action: {
                            withAnimation {
                                searchTerm = ""
                                isSearching = false
                            }
                        }) {
                            Text("Cancel") 
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                if isSearching && searchTerm.isEmpty {
                    VStack {
                        Text(NSLocalizedString("recently_searched", comment: ""))
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(Color.gray)
                            .padding(.top, 20)
                        
                        Text(NSLocalizedString("no_recent_searches", comment: ""))
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(Color.gray.opacity(0.8))
                            .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // قائمة الفئات والعناصر
                    List {
                        ForEach(filteredCategories, id: \.0) { (category, items) in
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(expandedCategory == category ? "Polygon 2" : "Polygon ")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .onTapGesture {
                                            withAnimation {
                                                expandedCategory = expandedCategory == category ? nil : category
                                            }
                                        }
                                    
                                    Text(category)
                                        .font(Font.custom("SF Pro Text", size: 20))
                                        .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
                                        .onTapGesture {
                                            withAnimation {
                                                expandedCategory = expandedCategory == category ? nil : category
                                            }
                                        }
                                }
                                .padding(.vertical, 5)
                                
                                if expandedCategory == category || !searchTerm.isEmpty {
                                    TagsView(tags: items, selectedTags: $selectedIngredients)
                                        .padding(.leading, 20)
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
                
                // زر Next
                NavigationLink(destination: IngredientsPage(selectedIngredients: $selectedIngredients)) {
                    Text(NSLocalizedString("next_button", comment: ""))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(selectedIngredients.isEmpty ? Color.gray : Color("green"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                .disabled(selectedIngredients.isEmpty)
            }
            .navigationBarTitle(NSLocalizedString("step_title", comment: ""), displayMode: .large)
        }
    }
}

struct TagsView: View {
    let tags: [String]
    @Binding var selectedTags: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Button(action: {
                        toggleTagSelection(tag)
                    }) {
                        Text(tag)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .foregroundColor(selectedTags.contains(tag) ? .white : .black)
                            .background(selectedTags.contains(tag) ? Color("green") : Color.gray.opacity(0.2))
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.15), radius: 0.5, x: 0, y: 1)
                    }
                }
            }
        }
    }
    
    private func toggleTagSelection(_ tag: String) {
        if selectedTags.contains(tag) {
            selectedTags.removeAll { $0 == tag }
        } else {
            selectedTags.append(tag)
        }
    }
}



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategorysPage()
    }
}
#endif
