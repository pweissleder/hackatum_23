//
//  RecipeImage.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct RecipeImage: View {
    
    let recipe: Recipe
    let width: CGFloat?
    let height: CGFloat?
    
    var body: some View {
        
        if let thumbnailName = recipe.thumbnailName {
            Image(thumbnailName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
        } else {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
            }
        }
    }
}
