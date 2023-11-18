//
//  Home.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI
import AVFoundation

struct Home: View {
    
    @ObservedObject var dataViewModel = DataViewModel.shared
    
    let columns: [GridItem] = [.init(.fixed(200)), .init(.fixed(200))]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(dataViewModel.favouriteRecipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            RecipePreviewView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Home")
        }
        
    }
    
    func getAndStartPlayer(name: String) -> AVPlayer {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp4")!))
        player.play()
        return player
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
