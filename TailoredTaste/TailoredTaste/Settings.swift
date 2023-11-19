//
//  Settings.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Settings: View {
    
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section("Diet") {
                        Diet()
                    }
                    NavigationLink(destination: Allergies(selectedAllergies: DataViewModel.shared.getAllergies())) {
                        Text("Allergies")
                    }
                    Button("Grant Permission") {
                        HealthKitService.shared.requestPermission()
                    }
                    
                    Button("Import Apple Health data") {
                        HealthKitService.shared.fetchData()
                    }
                    
                }
                .navigationBarTitle("Settings")
            }
        }
    }
}

struct Allergies: View {
    @State var selectedAllergies: Set<String>

        let allergies = [
            "Milk",
            "Eggs",
            "Fish",
            "Crustacean shellfish",
            "Tree nuts",
            "Peanuts",
            "Wheat",
            "Soybeans",
            "Sesame"
        ]

        var body: some View {
            List {
                        ForEach(allergies, id: \.self) { allergy in
                            Button(action: {
                                if selectedAllergies.contains(allergy) {
                                    selectedAllergies.remove(allergy)
                                } else {
                                    selectedAllergies.insert(allergy)
                                }
                            }) {
                                HStack {
                                    Text(allergy)
                                    Spacer()
                                    if selectedAllergies.contains(allergy) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
        }
}


struct Diet: View {
    let gridItems = Array(repeating: GridItem(.flexible()), count: 2) // Adjust the count as per your layout

        @State private var selectedButtonIndex: Int = 0

        var body: some View {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(0..<4) { index in
                    Button(action: {
                        // Update the selected button index
                        selectedButtonIndex = index
                    }) {
                        Text("Button \(index + 1)")
                            .padding()
                            .background(selectedButtonIndex == index ? Color.gray : Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(selectedButtonIndex == index ? Color.blue : Color.gray, lineWidth: 2)
                            )
                    }
                    .foregroundColor(selectedButtonIndex == index ? Color.white : Color.blue)
                }
            }
            .padding()
        }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
