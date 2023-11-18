//
//  ContentView.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 17.11.23.
//

import SwiftUI

import Foundation




struct ContentView: View {
    
    var body: some View {
        TabView {
            Feed()
                .tabItem {
                    Label("Explore", systemImage: "fork.knife")
                }
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Settings()
                .tabItem {
                    Label("Preferences", systemImage: "slider.horizontal.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
