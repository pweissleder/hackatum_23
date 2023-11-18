import Foundation

struct Recipes: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    var thumbnailName: String?
    var videoName: String?
    var isFavourite: Bool?
    var cookingEvents: [Date]?
    let vegetarian: Bool
    let vegan: Bool
    let glutenFree: Bool
    let dairyFree: Bool
    var peanutFree: Bool?
    let veryHealthy: Bool
    let cheap: Bool
    let veryPopular: Bool
    let sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let gaps: String
    let preparationMinutes: Int
    let cookingMinutes: Int
    let aggregateLikes: Int
    let healthScore: Int
    let creditsText: String
    let license: String?
    let sourceName: String
    let pricePerServing: Float
    let extendedIngredients: [Ingredient]
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String?
    let image: String
    let imageType: String
    let video: String?
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    let diets: [String]
    let occasions: [String]?
    let instructions: String
    let analyzedInstructions: [AnalyzedInstruction]?
    let originalId: String?
    let spoonacularScore: Float
    let spoonacularSourceUrl: String?
    
    let calories: Int
    let fat: Int
    let satFat: Int
    let carbs: Int
    let fiber: Int
    let protein: Int
    let sugar: Int
}

struct Ingredient: Codable {
    let id: Int
    let aisle: String
    let image: String
    let consistency: String
    let name: String
    let nameClean: String
    let original: String
    let originalName: String
    let amount: Float
    let unit: String
    let meta: [String]
    let measures: Measures
}

struct Measures: Codable {
    let us: MeasureDetails
    let metric: MeasureDetails
}

struct MeasureDetails: Codable {
    let amount: Float
    let unitShort: String
    let unitLong: String
}


struct AnalyzedInstruction: Codable {
    let name: String
    let steps: [RecipeStep]?
}

struct RecipeStep: Codable {
    let number: Int
    let step: String
    let ingredients: [RecipeIngredient]?
    let equipment: [RecipeEquipment]?
    let length: RecipeLength?
}

struct RecipeIngredient: Codable {
    let id: Int
    let name: String
    let localizedName: String
    let image: String
}

struct RecipeEquipment: Codable {
    let id: Int
    let name: String
    let localizedName: String
    let image: String
}

struct RecipeLength: Codable {
    let number: Int
    let unit: String
}

