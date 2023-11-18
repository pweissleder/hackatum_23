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
            VStack(){
                Spacer(minLength: 300)
                HStack{
                    Spacer()
                    LabelView(image:"dollarsign.circle.fill")
                    LabelView(image: "leaf")
                }.padding(10)
            }.background(
                RecipeImage(recipe: recipe, width: nil, height: nil)
            )
            
                //Image header
                
                VStack(alignment: .leading) {
                    // Title and quik info Calories, Minm persons
                    Text(recipe.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .font(.system(.title, design: .default))
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 5)
                    
                    HStack(alignment: .center, spacing: 5){
                        Spacer()
                        VStack{
                            Image(systemName: "flame")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .foregroundColor(.accentColor)
                                .scaledToFill()
                            Text("\(String(recipe.calories)) Calories")
                                .foregroundColor(.secondary)
                        }.padding(.horizontal, 5)
                        .frame(width: 110)
                        
                        VStack{
                            Image(systemName: "timer.square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .foregroundColor(.accentColor)
                                .scaledToFill()
                            Text("\(String(recipe.servings)) Minutes")
                                .foregroundColor(.secondary)
                            
                        }.padding(.horizontal, 5)
                            .frame(width: 110)
                        VStack{
                            Image(systemName: "person.2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .foregroundColor(.accentColor)
                                .scaledToFill()
                            Text("\(String(recipe.servings)) People")
                                .foregroundColor(.secondary)
                        }.padding(.horizontal, 5)
                            .frame(width: 110)
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
                        ProgressBarView(currentState: 30, name: "Carbs", finalState: 40, color: .accentColor)
                        ProgressBarView(currentState: 20, name: "Carbs", finalState: 60, color: .accentColor)
                        ProgressBarView(currentState: 10, name: "Carbs", finalState: 300, color: .accentColor)
                        ProgressBarView(currentState: 80, name: "Carbs", finalState: 400, color: .accentColor)
                        ProgressBarView(currentState: 10, name: "Carbs", finalState: 10, color: .accentColor)
                        ProgressBarView(currentState: 30, name: "Carbs", finalState: 30, color: .accentColor)
                        
                        
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
