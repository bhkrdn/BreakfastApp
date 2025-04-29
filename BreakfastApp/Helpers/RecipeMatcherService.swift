import Foundation

struct RecipeMatcherService {
    
    // Placeholder for the function that will find matching recipes.
    // We will implement this next.
    static func findMatchingRecipes(pantryIngredients: Set<String>, allRecipes: [Recipe]) -> [RecipeMatchResult] {
        
        // Normalize pantry ingredients once for efficient comparison
        let normalizedPantry = Set(pantryIngredients.map { $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }.filter { !$0.isEmpty })
        
        var results: [RecipeMatchResult] = []
        
        for recipe in allRecipes {
            // Normalize recipe ingredients
            let normalizedRecipeIngredients = Set(recipe.ingredients.map { $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }.filter { !$0.isEmpty })
            
            // Find ingredients missing from the pantry
            let missing = normalizedRecipeIngredients.subtracting(normalizedPantry)
            
            // Create the result object (matchType is calculated in its init)
            let result = RecipeMatchResult(recipe: recipe, missingIngredients: Array(missing).sorted()) // Sort missing ingredients alphabetically
            
            results.append(result)
        }
        
        // Sort the results: Full match first, then Missing One, then Missing Many.
        // Within each category, sort alphabetically by recipe name.
        results.sort { (lhs, rhs) -> Bool in
            if lhs.matchType != rhs.matchType {
                // Use the Comparable conformance of MatchType (.full < .missingOne < .missingMany)
                return lhs.matchType < rhs.matchType
            } else {
                // If match types are the same, sort alphabetically by name
                return lhs.recipe.name.localizedCompare(rhs.recipe.name) == .orderedAscending
            }
        }
        
        return results
    }
}

// Placeholder for the result structure. We will define this properly next.
// struct RecipeMatchResult { // Removed placeholder - definition moved to Models/RecipeMatchResult.swift
//     let recipe: Recipe
//     // Other properties like missingIngredients and matchType will be added.
// } 