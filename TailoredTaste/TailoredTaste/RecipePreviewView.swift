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
        VStack(alignment: .center, spacing: 0) {
            RecipeImage(recipe: recipe, width: 170, height: 135)
            Spacer().frame(height: 5)
            VStack {
                Spacer()
                Text(recipe.title)
                    .font(.headline)
                    .frame(width: 150, height: 52)
                Spacer()
            }
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .frame(width: 170, height: 190)
        
    
    }
}
