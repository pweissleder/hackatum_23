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
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(playableRecipes){ playableRecipe in
                
                ZStack{
                    
                    Player(player: playableRecipe.player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .offset(y: -5)
                    .onAppear() {
                        playableRecipe.player.play()
                    }
                    
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
                    
                    
                    HStack(alignment: .bottom) {
                        Spacer()
                        VStack {
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
                                        .font(.title)
                                }
                            }
                        }
                        
                        
                    }
                    
                }
            }
        }
    }
}
