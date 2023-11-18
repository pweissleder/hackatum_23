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
        
        ScrollView {
            Spacer(minLength: 50)
            VStack(){
                Spacer(minLength: 200)
                HStack{
                    Spacer()
                    LabelView(image:"dollarsign.circle.fill")
                    LabelView(image: "leaf")
                }.padding(10)
            }.background(
                RecipeImage(recipe: recipe, size: 500)
            )
            
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
                        Spacer()
                        VStack{
                            Image(systemName: "waveform.path.ecg")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                            Text("\(String(recipe.calories)) Calories")
                                .foregroundColor(.secondary)
                        }
                        
                        VStack{
                            Image(systemName: "hourglass")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                            Text("\(String(recipe.servings)) Minutes")
                                .foregroundColor(.secondary)
                            
                        }
                        VStack{
                            Image(systemName: "person.2")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .frame(width: 50, height: 50)
                                .scaledToFill()
                                .padding(5)
                            Text("\(String(recipe.servings)) People")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
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
                        Text("Instructions")
                            .font(.system(.title, design:
                                    .default))
                        Spacer()
                        
                        Text(recipe.instructions)
                        
                        
                    }
                }
                .padding(10)
            .navigationBarTitleDisplayMode(.inline)
        }.ignoresSafeArea(.all)
    }
}
