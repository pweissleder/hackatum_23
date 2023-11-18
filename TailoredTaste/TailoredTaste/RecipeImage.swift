//
//  RecipeImage.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct RecipeImage: View {
    
    let recipe: Recipe
    let size: CGFloat
    
    var body: some View {
        
        if let thumbnailName = recipe.thumbnailName {
            Image(thumbnailName)
                .resizable()
                .scaledToFit()
                .frame(width: size)
        } else {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
            }
        }
    }
}
