//
//  Home.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Home: View {
    
    let columns: [GridItem] = [.init(.fixed(200)), .init(.fixed(200))]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(getRecipes()) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            RecipePreviewView(recipe: recipe)
                        }

                        
                    }
                }
            }
        }
        .navigationTitle("Hello Benedict")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func getRecipes() -> [Recipe] {
        if let fileUrl = Bundle.main.url(forResource: "tenRecipes", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let recipes = try decoder.decode(Recipes.self, from: jsonData)
                return recipes.recipes

            } catch {
                print("Error reading or decoding JSON: \(error)")
            }
        } else {
            print("Could not locate the JSON file.")
        }
        return []
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
