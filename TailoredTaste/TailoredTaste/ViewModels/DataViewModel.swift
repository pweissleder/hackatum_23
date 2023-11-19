import Foundation
import SwiftUI
import AVKit

public class DataViewModel: ObservableObject {
    
    static let shared = DataViewModel()
    
    @Published var preferences: Preferences = Preferences(isCheatDay: false, vegetarian: false, vegan: false, pescetarian: false, carnivore: true, glutenFree: false, dairyFree: false, peanutFree: true, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, cuisines: [], diets: [])
    @Published var recipes: [Recipe] = []
    
    @Published var filteredRecipes: [Recipe] = []
    @Published var favouriteRecipes: [Recipe] = []
    @Published var cookedMeals: [Int: [Date]] = [:]
    
    
    
    init() {
        recipes = getRecipes()
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
            && ($0.peanutFree == preferences.peanutFree || $0.peanutFree ?? true)
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
        let recipe = recipes.first(where: {$0.id == id})!
        HealthKitService.shared.exportNutritionData(calories: recipe.calories, fat: recipe.fat, satFat: recipe.satFat, carbs: recipe.carbs, fiber: recipe.fiber, protein: recipe.protein, sugar: recipe.sugar)
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
    
    func updateDiet(diet: DietEnum) {
        switch diet {
        case .carnivore:
            preferences.vegan = true
            preferences.vegetarian = true
            preferences.pescetarian = true
        case .pescetarian:
            preferences.vegan = true
            preferences.vegetarian = true
            preferences.pescetarian = true
        case .vegetarian:
            preferences.vegan = true
            preferences.vegetarian = true
            preferences.pescetarian = false
        case .vegan:
            preferences.vegan = true
            preferences.vegetarian = false
            preferences.pescetarian = false
        }
    }
    
    func getAllergies() -> Set<String> {
        var allergies: [String] = []
        if preferences.glutenFree {
            allergies.append("Gluten")
        }
        
        if preferences.dairyFree {
            allergies.append("Milk")
        }
        
        if preferences.peanutFree {
            allergies.append("Peanuts")
        }
        return Set(allergies)
    }
    
    
}
