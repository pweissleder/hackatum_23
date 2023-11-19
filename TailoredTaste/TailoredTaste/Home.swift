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
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height: 50)
                    Text("Hey Benedict 👋🏼")
                        .font(.largeTitle)
                        .bold()
                        .padding(3)
                    Text("Welcome Back!")
                    .font(.title2)
                        .bold()
                        .foregroundColor(.accentColor)
                    
                Spacer().frame(height: 50)
                ZStack{
                    ProgressBarView(currentState: 450 , name: "Today's Calories", finalState: 2200, color: .accentColor)
                        
                }
                HStack {
                    Text("Favorites")
                        .bold()
                        .padding(.horizontal, 10)
                        .font(.title)
                        Spacer()
                }
                if dataViewModel.favouriteRecipes.isEmpty {
                    VStack(alignment: .center) {
                        Spacer().frame(height: 80)
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Select Explore and Discover your Personalized Recipe Recomendations")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.accentColor)
                                .multilineTextAlignment(.center)
                                .frame(width:300, height: 200)
                            Spacer()
                        }
                        Spacer()
                    }
                } else {
                LazyVGrid(columns: [.init(), .init()]) {
                    
                        ForEach(dataViewModel.favouriteRecipes) { recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                RecipePreviewView(recipe: recipe)
                                    .padding(10)
                                
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .navigationBarHidden(true)
            .navigationTitle("Back")
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
