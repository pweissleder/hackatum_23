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
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    var body: some View {
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
                    VStack(alignment: .center, spacing: 10){
                        HStack {
                            Spacer()
                            Text("Nutrition")
                                .font(.system(.title, design:
                                        .default))
                            Spacer()
                        }
                        ProgressBarView(currentState: CGFloat(recipe.carbs) , name: "Carbs", finalState: 230, color: .accentColor)
                        ProgressBarView(currentState: CGFloat(recipe.fat), name: "Fat", finalState: 60, color: .accentColor)
                        ProgressBarView(currentState: CGFloat(recipe.satFat), name: "SatFat", finalState: 30, color: .accentColor)
                        ProgressBarView(currentState: CGFloat(recipe.protein), name: "Protein", finalState: 92, color: .accentColor)
                        ProgressBarView(currentState: CGFloat(recipe.sugar), name: "Sugar", finalState: 35, color: .accentColor)
                        
                        
                    }
                    .padding(5)
                    
                    Button {
                        dataViewModel.markAsCooked(id: recipe.id)
                    } label: {
                        Image(systemName: "frying.pan")
                    }
                    
                    if let cookedEvents = dataViewModel.cookedMeals[recipe.id], let last = cookedEvents.last {
                        Text("last cooked at " + last.description)
                    }
                    

                    VStack(alignment: .center) {
                        
                        LazyVGrid(columns: [.init(), .init(), .init()]) {
                            ForEach(recipe.extendedIngredients) { ingredient in
                                IngredientView(ingredient: ingredient)
                            }
                        }
                        
                        ForEach(recipe.analyzedInstructions.first?.steps ?? []) { step in
                            VStack {
                                Text(String(step.number))
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding(7)
                                    .overlay(Circle().stroke(Color.primary, lineWidth: 1))
                                Text(step.step)
                            }
                        }
                    }
                }
                .padding(10)
            .navigationBarTitleDisplayMode(.inline)
        }.ignoresSafeArea(.all)
    }
}
