//
//  Feed.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI
import AVKit


struct PlayableRecipe: Identifiable {
    var id: Int
    var player: AVPlayer
    var recipe: Recipe
    var replay: Bool
}

struct Feed: View {
        
    @State var playableRecipes: [PlayableRecipe] = []
    
    @State var isLoaded = false
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    var body: some View {
        ZStack {
            PlayerScrollView(data: $playableRecipes)
                .edgesIgnoringSafeArea(.all)
        }.onChange(of: dataViewModel.filteredRecipes) { filteredRecipes in
            playableRecipes = playableRecipes.filter { playableRecipe in
                filteredRecipes.contains(where: {$0.id == playableRecipe.id})
            }
            playableRecipes.first?.player.play()
        }
        .onAppear {
            if !isLoaded {
                playableRecipes = DataViewModel.shared.filteredRecipes.filter { $0.videoName != nil }.map { PlayableRecipe(id: $0.id, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: $0.videoName!, ofType: "mp4")!)), recipe: $0, replay: false)}
                isLoaded = true
            }
        }
        
    }
    
    
}

