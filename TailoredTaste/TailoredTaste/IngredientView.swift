//
//  IngredientView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI

struct IngredientView: View {
    let ingredient: Ingredient
    
    var body: some View {
        VStack(alignment: .center){
            
            AsyncImage(url: URL(string: "https://spoonacular.com/cdn/ingredients_100x100/" + ingredient.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
            }
            
            if ingredient.unit != "" {
                HStack(spacing: 5){
                    Text(String(Int(ingredient.amount)))
                        .font(.footnote)
                        .lineLimit(1)
                    Text(ingredient.unit)
                        .font(.footnote)
                        .lineLimit(1)
                }
                Text(ingredient.nameClean)
                    .font(.footnote)
                    .lineLimit(1)
            } else {
                Text(ingredient.originalName)
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
        .padding(5)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: Ingredient(id: 0, aisle: "", image: "avocado", consistency: "", name: "avocado", nameClean: "", original: "", originalName: "", amount: 500, unit: "g", meta: [], measures: .init(us: .init(amount: 0, unitShort: "", unitLong: ""), metric: .init(amount: 0, unitShort: "", unitLong: ""))))
    }
}
