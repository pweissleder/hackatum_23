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
            RecipeImage(recipe: recipe, width: 180, height: 150)
            Text(recipe.title)
                .font(.headline)
                .padding(8)
                .frame(height: 40)
                .background(Rectangle().background(Color.red).cornerRadius(20))
                .cornerRadius(40)
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .frame(width: 180, height: 200)
    }
}
