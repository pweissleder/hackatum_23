//
//  ContentView.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 17.11.23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            Feed()
                .tabItem {
                    Label("feed", systemImage: "fork.knife")
                }
            Home()
                .tabItem {
                    Label("home", systemImage: "house")
                }
            Settings()
                .tabItem {
                    Label("preferences", systemImage: "slider.horizontal.3")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
