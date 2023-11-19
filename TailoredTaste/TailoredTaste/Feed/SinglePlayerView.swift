//
//  SinglePlayerView.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 19.11.23.
//

import SwiftUI

struct SinglePlayerView: View {
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    @State var displayRecipeDetail: Bool = false
    
    @State var likeOpacity = 0.0
    
    let playableRecipe: PlayableRecipe
    
    var body: some View {
        ZStack{
            Player(player: playableRecipe.player)
                
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .offset(y: -5)
            .onTapGesture(count: 2) {
                DataViewModel.shared.addToFavourites(id: playableRecipe.id)
                self.likeOpacity = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.likeOpacity = 0.0
                }
            }
            .onLongPressGesture() {
                displayRecipeDetail = true
                print(playableRecipe.recipe.title)
            }
            .onDisappear() {
                playableRecipe.player.pause()
            }
            .sheet(isPresented: $displayRecipeDetail) {
                RecipeDetailView(recipe: playableRecipe.recipe)
            }
            .onTapGesture {
                playableRecipe.player.seek(to: .zero)
                playableRecipe.player.play()
            }
            
            
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .opacity(likeOpacity)
                .animation(.easeOut, value: likeOpacity)
            
        }
    }
}
