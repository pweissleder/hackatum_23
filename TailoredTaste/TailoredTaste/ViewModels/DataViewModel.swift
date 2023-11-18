import Foundation
import SwiftUI


public class DataViewModel: ObservableObject {
    @Published var preferences: Preferences = Preferences(isCheatDay: false, vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, cuisines: [], diets: [])
    @Published var recipes: [Recipe] = []
    
    var filteredRecipes: [Recipe] = []
    var favouriteRecipes: [Recipe] = []
    
    init() {
        recipes = getRecipes()
        preferences = initPreferences()
        updateFavouriteRecipes()
    }
    
    func getRecipes() -> [Recipe] {
        // Locate the URL of the JSON file
        if let fileUrl = Bundle.main.url(forResource: "tenRecipes", withExtension: "json") {
            do {
                // Read the contents of the file
                let jsonData = try Data(contentsOf: fileUrl)
                
                // Decode JSON data into the Recipe structure
                let decoder = JSONDecoder()
                let recipes = try decoder.decode(Recipes.self, from: jsonData)
                
                // Now 'recipe' contains the parsed data
                
                print("JsonDecoder: Imported  \(recipes.recipes.count) recipes.")
                return recipes.recipes
                
                // Access other properties as needed
                // ...
                
            } catch {
                print("Error reading or decoding JSON: \(error)")
            }
        } else {
            print("Could not locate the JSON file.")
        }
        return []
    }
    
    func initPreferences() -> Preferences {
        return Preferences(isCheatDay: false, vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, cuisines: [], diets: [])
    }
    
    func updateFavouriteRecipes() -> Void {
        favouriteRecipes = recipes.filter {$0.isFavourite == true}
    }
    
    
    func updateFilteredRecipes() -> Void {
        if (!preferences.isCheatDay) {
            filteredRecipes = recipes.filter {
                ($0.veryHealthy == preferences.veryHealthy || $0.veryHealthy)
                && DataViewModel.checkDiets(dietsR: $0.diets, dietsP: preferences.diets)
            }
        }
        filteredRecipes = recipes.filter {
            ($0.vegetarian == preferences.vegetarian || $0.vegetarian)
            && ($0.vegan == preferences.vegan || $0.vegan)
            && ($0.glutenFree == preferences.glutenFree || $0.glutenFree)
            && ($0.dairyFree == preferences.dairyFree || $0.dairyFree)
        }
        
    }
    private static func checkDiets(dietsR: [String], dietsP: [String]) -> Bool {
        for dietP in dietsP {
            if !dietsR.contains(dietP) {
                return false
            }
        }
        return true
    }
    
    
    func toggleCheatDay() -> Void {
        preferences.isCheatDay.toggle()
        updateFilteredRecipes()
    }
    
    func markAsCooked(id: Int) -> Void {
        let cookingEvent = Date.now
        let rIndex = recipes.firstIndex(where: {$0.id == id})!
        var cookingEvents = recipes[rIndex].cookingEvents ?? []
        cookingEvents.append(cookingEvent)
                recipes[rIndex].cookingEvents = cookingEvents
    }
    
    func addToFavourites(id: Int) {
        let rIndex = recipes.firstIndex(where: {$0.id == id})!
        recipes[rIndex].isFavourite = true
        updateFavouriteRecipes()
    }
    
    func removeFromFavourites(id: Int) {
        let rIndex = recipes.firstIndex(where: {$0.id == id})!
        recipes[rIndex].isFavourite = false
        updateFavouriteRecipes()
    }
}
