//
//  Settings.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var viewModel = DataViewModel.shared
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    NavigationLink(destination: Diet()) {
                        Text("Diet")
                    }
                    NavigationLink(destination: Allergies(selectedAllergies: viewModel.getAllergies())) {
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
    @ObservedObject var viewModel = DataViewModel.shared
    
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

       @State private var selectedButtonIndex: Int?

    @State private var selectedDiets = Diets()

       struct Diets {
           var vegetarian = false
           var vegan = false
           var pescetarian = false
           var carnivore = false
           var glutenFree = false
           var dairyFree = false
           var peanutFree = false
       }

       var body: some View {
           List {
               Toggle("Vegetarian", isOn: $selectedDiets.vegetarian)
               Toggle("Vegan", isOn: $selectedDiets.vegan)
               Toggle("Pescetarian", isOn: $selectedDiets.pescetarian)
               Toggle("Gluten-Free", isOn: $selectedDiets.glutenFree)
               Toggle("Dairy-Free", isOn: $selectedDiets.dairyFree)
               Toggle("Peanut-Free", isOn: $selectedDiets.peanutFree)
           }
           .padding()
       }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
