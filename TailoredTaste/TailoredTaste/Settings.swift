//
//  Settings.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Settings: View {
    let shared = HealthKitService()
    @State var textda : Bool = true
    var body: some View {
        VStack {
            Text("Settings").onAppear {
                print("Peanut: \(DataViewModel.shared.preferences.peanutFree)\n healthy: \(DataViewModel.shared.preferences.veryHealthy)")
            }
            Button("Request Permission") {
                shared.requestPermission()
            }
            Button("fetch data") {
                shared.fetchAllergies()
                print("Peanut: \(DataViewModel.shared.preferences.peanutFree)\n healthy: \(DataViewModel.shared.preferences.veryHealthy)")
            }
            Text("assad").opacity(DataViewModel.shared.preferences.veryHealthy ? 1.0 : 0.1)
        }
        
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
