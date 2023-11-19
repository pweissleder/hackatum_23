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
    @State var selected: Int = 0
    
    @StateObject private var shakeDetector = ShakeDetector()
    
    var body: some View{
        ZStack {
            VStack(spacing: 0){
                
                ForEach(playableRecipes){ playableRecipe in
                    SinglePlayerView(playableRecipe: playableRecipe)
                }
            }
        }
        .onAppear() {
            playableRecipes.first?.player.play()
            playableRecipes.first?.player.actionAtItemEnd = .none
            shakeDetector.onShake = {
                DataViewModel.shared.toggleCheatDay()
            }
        }
    }
}
