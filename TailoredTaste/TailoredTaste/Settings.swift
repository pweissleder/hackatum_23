//
//  Settings.swift
//  TailoredTaste
//
//  Created by Benedict Bode Privat on 18.11.23.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var viewModel = DataViewModel.shared
    @State var isPresented = false
    @State var authorization = false
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section("Personal Information"){
                        NavigationLink(destination: Diet()) {
                            Text("Diet")
                        }
                        NavigationLink(destination: Allergies(selectedAllergies: viewModel.getAllergies())) {
                            Text("Allergies")
                        }
                    }
                    Section("Integrations"){
                        if !authorization {
                            Button {
                                HealthKitService.shared.requestPermission()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    authorization = true
                                }
                                
                            } label: {
                                HStack{
                                    Image("appleHealthIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Grant Permission")
                                        .padding(.horizontal,10)
                                    Spacer()
                                }
                            }
                        }
                        Button {
                            HealthKitService.shared.fetchData()
                            isPresented = true
                        } label: {
                            Label("Refresh Apple Health data", systemImage: "tray.full")
                        }
                        .alert(isPresented: $isPresented) {
                            Alert(title: Text("Sucessfully imported allergies from Apple Health"))
                        }
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
                                            .foregroundColor(Color.accentColor)
                                    }
                                }
                            }
                        }
                    }
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
       }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
