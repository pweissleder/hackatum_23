//
//  RecipeDetailView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        
        
        ScrollView {
            VStack(){
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .font(.system(.title, design: .default))
                        .foregroundColor(Color.black)
                        .padding(5)
                HStack{
                    ForEach(0..<Int((recipe.spoonacularScore/20).rounded())) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(5)
                Group{
                    HStack{
                        Text(String(recipe.servings))
                        Image(systemName: "person.2")
                    }
                    HStack{
                        Text(String(recipe.readyInMinutes))
                        Image(systemName: "clock")
                    }
                }
                .font(.footnote)
                .foregroundColor(Color.black)
                
                //Ingredients
                VStack(alignment: .center, spacing: 10){
                    HStack {
                        Spacer()
                        Text("Ingredients")
                            .font(.system(.title, design:
                                    .default))
                        Spacer()
                    }
                }
                .padding(5)
                
                LazyVGrid(columns: [.init(), .init(), .init(), .init(), .init(), .init()]){
                    NutritionalItemView(value: recipe.calories, name: "Calories", unitName: "kcal")
                    NutritionalItemView(value: recipe.fat, name: "Fat", unitName: "g")
                    NutritionalItemView(value: recipe.satFat, name: "SatFat", unitName: "g")
                    NutritionalItemView(value: recipe.carbs, name: "Carbs", unitName: "g")
                    NutritionalItemView(value: recipe.fiber, name: "Fiber", unitName: "g")
                    NutritionalItemView(value: recipe.protein, name: "Protein", unitName: "g")
                    NutritionalItemView(value: recipe.sugar, name: "Sugar", unitName: "g")
                }
                
                //Instructions
                HStack{
                    Text(recipe.instructions)
                }
            }
        }
        .ignoresSafeArea(.all)
        
    }
}
