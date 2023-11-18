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
            RecipeImage(recipe: recipe, size: 200)
            Text(recipe.title).font(.headline)
                .padding(5)
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .frame(width: 180)
    }
}
