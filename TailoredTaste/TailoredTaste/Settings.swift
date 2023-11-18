//
//  Settings.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Settings: View {
    let shared = HealthKitService()
    var body: some View {
        VStack {
            NavigationView {
                      List {
                          Section("Diet") {
                              Diet()
                          }
                          NavigationLink(destination: Allergies()) {
                              Text("I don't eat that")
                          }
                          NavigationLink(destination: Allergies()) {
                              Text("Cuisines")
                          }
                          Button("Import Apple Health data") {
                              shared.fetchData()
                          }
                      }
                      .navigationBarTitle("Settings")
                  }
        }
    }
}

struct Allergies: View {
    var body: some View {
        Text("Allergies")
    }
}

@ViewBuilder func gridEntry(diet: DietEnum) -> some View {
    var icon: String {
        switch diet {
        case .carnivore:
            "figure.stand"
        case .pescetarian:
            "fish"
        case .vegetarian:
            "drop.fill"
        case .vegan:
            "leaf"
        }
    }
    Button {
        DataViewModel.shared.updateDiet(diet: diet)
    } label: {
        ZStack {
            
            RoundedRectangle(cornerSize:
                                CGSize(width: 10, height: 20))
            .foregroundColor(.white)
            .shadow(radius: 5)
            Image(systemName: icon)
                .font(.system(size: 50))
               
        }
        
    }
    
}


struct Diet: View {
    var body: some View {
        LazyVGrid (columns: [.init(), .init()]) {
            gridEntry(diet: .carnivore)
            gridEntry(diet: .pescetarian)
            gridEntry(diet: .vegetarian)
            gridEntry(diet: .vegan)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
