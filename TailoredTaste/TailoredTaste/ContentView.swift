//
//  ContentView.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 17.11.23.
//

import SwiftUI

import Foundation




struct ContentView: View {
    
    
    
        
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").onAppear {
                getREcipes()
                
            }
        }
        .padding()
    }
        
        func getREcipes() -> [Recipe] {
            // Locate the URL of the JSON file
            if let fileUrl = Bundle.main.url(forResource: "tenRecipes", withExtension: "json") {
                do {
                    // Read the contents of the file
                    let jsonData = try Data(contentsOf: fileUrl)

                    // Decode JSON data into the Recipe structure
                    let decoder = JSONDecoder()
                    let recipes = try decoder.decode(Recipes.self, from: jsonData)

                    // Now 'recipe' contains the parsed data
                    print(recipes.recipes.first!.title)
                    print(recipes.recipes.first!.summary)
                    print(recipes.recipes.count)
                    return recipes.recipes

                    // Access other properties as needed
                    // ...

                } catch {
                    print("Error reading or decoding JSON: \(error)")
                }
            } else {
                print("Could not locate the JSON file.")
            }
            return []
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
