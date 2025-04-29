import Foundation

struct PantryStorageService {
    
    private static let pantryKey = "pantryIngredients"
    
    // Load ingredients from UserDefaults, returning an empty set if none are found or on error.
    static func loadPantry() -> Set<String> {
        if let savedIngredients = UserDefaults.standard.array(forKey: pantryKey) as? [String] {
            return Set(savedIngredients)
        }
        // Return empty set if no data found or if data is corrupted (not [String])
        return Set<String>()
    }
    
    // Save the current set of ingredients to UserDefaults.
    static func savePantry(_ ingredients: Set<String>) {
        // Convert Set to Array for UserDefaults storage
        let ingredientsArray = Array(ingredients)
        UserDefaults.standard.set(ingredientsArray, forKey: pantryKey)
        // Note: UserDefaults saves asynchronously in the background.
        // For critical data, you might call UserDefaults.standard.synchronize(), but it's often discouraged.
    }
    
    // Add a single ingredient and save the updated pantry.
    static func addIngredient(_ name: String) {
        var currentPantry = loadPantry()
        // Normalize the ingredient name (e.g., lowercase, trim whitespace)
        let normalizedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if !normalizedName.isEmpty {
            currentPantry.insert(normalizedName)
            savePantry(currentPantry)
        }
    }
    
    // Remove a single ingredient and save the updated pantry.
    static func removeIngredient(_ name: String) {
        var currentPantry = loadPantry()
        // Normalize the name to ensure matching
        let normalizedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if currentPantry.remove(normalizedName) != nil { // Check if element was actually removed
            savePantry(currentPantry)
        }
    }
} 