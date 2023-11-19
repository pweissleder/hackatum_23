//
//  PlayerView.swift
//  TiktokSwiftUI
//
//  Created by Giresh Dora on 14/06/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit

struct PlayerView: View {
    
    @Binding var playableRecipes: [PlayableRecipe]
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    @State var displayRecipeDetail: Bool = false
    
    @State var likeOpacity = 0.0
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(playableRecipes){ playableRecipe in
                
                ZStack{
                    
                    Player(player: playableRecipe.player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .offset(y: -5)
                    .onTapGesture(count: 2) {
                        DataViewModel.shared.addToFavourites(id: playableRecipe.id)
                        self.likeOpacity = 1.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.likeOpacity = 0.0
                            dataViewModel.markAsCooked(id: playableRecipe.id)
                        }
                    }
                    .onTapGesture {
                        displayRecipeDetail = true
                    }
                    .onDisappear() {
                        playableRecipe.player.pause()
                    }
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .opacity(likeOpacity)
                        .animation(.easeOut, value: likeOpacity)
                    
                    /*if playableRecipe.replay {
                        Button(action: {
                            playableRecipe.player.seek(to: .zero)
                            playableRecipe.player.play()
                            playableRecipe.replay = false
                        }){
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 55, height: 60)
                                .foregroundColor(.white)
                            
                        }
                    }*/
                    
                    
                    /*HStack() {
                        Spacer()
                        VStack(spacing: 10) {
                            if !dataViewModel.favouriteRecipes.contains(where: { $0.id == playableRecipe.id }) {
                                Button {
                                    DataViewModel.shared.addToFavourites(id: playableRecipe.id)
                                } label: {
                                    Image(systemName: "heart")
                                        .font(.title)
                                }
                            } else {
                                Button {
                                    DataViewModel.shared.removeFromFavourites(id: playableRecipe.id)
                                } label: {
                                    Image(systemName: "heart.fill")
                                        
                                }
                            }
                            
                            Button {
                                displayRecipeDetail = true
                            } label: {
                                Image(systemName: "book")
                            }
                            .sheet(isPresented: $displayRecipeDetail) {
                                RecipeDetailView(recipe: playableRecipe.recipe)
                            }
                        }
                        .font(.title)
                        
                    }*/
                    
                }
            }
        }
        .onAppear() {
            playableRecipes.first?.player.play()
            playableRecipes.first?.player.actionAtItemEnd = .none
        }
    }
}
