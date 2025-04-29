import Foundation

struct FavoritesStorageService {
    
    private static let favoritesKey = "favoriteRecipeIDs"
    
    // Load favorite recipe IDs from UserDefaults.
    // Returns an empty set if none are found or on error.
    static func loadFavorites() -> Set<UUID> {
        guard let savedUUIDStrings = UserDefaults.standard.array(forKey: favoritesKey) as? [String] else {
            // No data found or data is not an array of strings
            return Set<UUID>()
        }
        
        // Convert string array back to Set<UUID>
        let favoriteIDs = savedUUIDStrings.compactMap { UUID(uuidString: $0) }
        return Set(favoriteIDs)
    }
    
    // Save the current set of favorite recipe IDs to UserDefaults.
    static func saveFavorites(_ favoriteIDs: Set<UUID>) {
        // Convert Set<UUID> to [String] for UserDefaults storage
        let uuidStrings = favoriteIDs.map { $0.uuidString }
        UserDefaults.standard.set(uuidStrings, forKey: favoritesKey)
    }
    
    // Add a recipe ID to favorites and save.
    static func addFavorite(_ recipeId: UUID) {
        var currentFavorites = loadFavorites()
        let (inserted, _) = currentFavorites.insert(recipeId)
        if inserted { // Save only if the ID was actually new
            saveFavorites(currentFavorites)
        }
    }
    
    // Remove a recipe ID from favorites and save.
    static func removeFavorite(_ recipeId: UUID) {
        var currentFavorites = loadFavorites()
        if currentFavorites.remove(recipeId) != nil { // Save only if the ID was actually removed
            saveFavorites(currentFavorites)
        }
    }
    
    // Check if a recipe ID is in favorites.
    static func isFavorite(recipeId: UUID) -> Bool {
        let currentFavorites = loadFavorites()
        return currentFavorites.contains(recipeId)
    }
} 