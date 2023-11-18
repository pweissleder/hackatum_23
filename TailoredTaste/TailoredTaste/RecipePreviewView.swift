//
//  RecipePreviewView.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct RecipePreviewView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
            } placeholder: {
                
            }
            Text(recipe.title).font(.headline)
                .padding(5)
        }
        .background(Color("lightGreen"))
        .cornerRadius(12)
        .shadow(radius: 4)
        .frame(width: 200)
    }
}
