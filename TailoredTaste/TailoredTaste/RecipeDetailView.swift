//
//  RecipeDetailView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI
import Charts

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        
        //Image und Label
        VStack(spacing: 0) {
            VStack(alignment: .trailing){
                Spacer()
                HStack{
                    LabelView(image:"dollarsign.circle.fill")
                    LabelView(image: "leaf")
                }
            }.background(
                RecipeImage(recipe: recipe, width: nil, height: nil)
            )
            
            ScrollView {
                VStack() {
                    //Image header
                    
                    VStack(alignment: .leading) {
                        // Title and quik info Calories, Minm persons
                        Text(recipe.title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .font(.system(.title, design: .default))
                            .foregroundColor(Color.black)
                            .padding(5)
                        HStack(alignment: .center){
                            VStack{
                                Image(systemName: "waveform.path.ecg")
                                    .foregroundColor(.accentColor)
                                    .frame(width: 80, height: 80)
                                Text("\(String(recipe.calories)) Calories")
                                    .foregroundColor(.secondary)
                            }
                            
                            VStack{
                                Image(systemName: "person.2")
                                    .foregroundColor(.accentColor)
                                    .frame(width: 80, height: 80)
                                Text("\(String(recipe.servings)) Minutes")
                                    .foregroundColor(.secondary)
                                
                            }
                            VStack{
                                Image(systemName: "person.2")
                                    .foregroundColor(.accentColor)
                                    .frame(width: 80, height: 80)
                                    .padding(5)
                                Text("\(String(recipe.servings)) People")
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        
                        
                        
                        // Nutrition
                        VStack(alignment: .leading, spacing: 10){
                            HStack {
                                Spacer()
                                Text("Nutrition")
                                    .font(.system(.title, design:
                                            .default))
                                Spacer()
                            }
                        }
                        .padding(5)
                        
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
                        
                        
                        VStack(alignment: .leading) {
                            ForEach(recipe.extendedIngredients, id: \.id) { ingredient in
                                HStack {
                                    AsyncImage(url: URL(string: "https://spoonacular.com/cdn/ingredients_100x100/" + ingredient.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    } placeholder: {
                                        Image("placeholder")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    }
                                    Text(ingredient.original)
                                }
                            }
                            
                            //Instructions
                            
                            Text(recipe.instructions)
                            
                        }
                    }
                }
                .ignoresSafeArea(.all)
            }
        }
    }
}
