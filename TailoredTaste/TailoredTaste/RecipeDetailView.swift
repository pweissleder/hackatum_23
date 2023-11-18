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
        
        //Image und Label
        VStack(spacing: 0) {
            ScrollView {
                VStack() {
                    RecipeImage(recipe: recipe, width: nil, height: nil)
                    
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
                .ignoresSafeArea(.all)
            }
        }
        .navigationTitle(recipe.title)
    }
}
