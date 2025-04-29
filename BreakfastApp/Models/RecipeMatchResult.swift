import Foundation

// Defines the type of match found between pantry and recipe ingredients.
enum MatchType: Comparable {
    case full           // All ingredients are present in the pantry.
    case missingOne     // Exactly one ingredient is missing.
    case missingMany    // More than one ingredient is missing.
    // case notEnough // Could add this if we want to filter out recipes with too many missing ingredients
}

// Structure to hold the result of matching a recipe against the pantry.
struct RecipeMatchResult: Identifiable {
    let id: UUID // Use the recipe's ID for Identifiable conformance.
    let recipe: Recipe
    let missingIngredients: [String]
    let matchType: MatchType
    
    // Initialize using a Recipe object and the calculated match details.
    init(recipe: Recipe, missingIngredients: [String]) {
        self.id = recipe.id
        self.recipe = recipe
        self.missingIngredients = missingIngredients
        
        // Determine the match type based on the number of missing ingredients.
        switch missingIngredients.count {
        case 0:
            self.matchType = .full
        case 1:
            self.matchType = .missingOne
        default:
            self.matchType = .missingMany
        }
    }
} 