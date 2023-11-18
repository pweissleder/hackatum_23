//
//  Home.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    let columns: [GridItem] = [.init(.fixed(200)), .init(.fixed(200))]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(dataViewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            RecipePreviewView(recipe: recipe)
                        }

                        
                    }
                }
            }
            .padding(20)
            .navigationTitle("Hello Benedict")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
