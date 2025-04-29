import Foundation
import Combine // For ObservableObject and @Published

class FavoritesViewModel: ObservableObject {
    
    // Published property to hold the set of favorite recipe IDs.
    @Published var favoriteRecipeIDs: Set<UUID> = []
    
    init() {
        // Load saved favorites when the ViewModel is initialized.
        loadFavorites()
    }
    
    // Load favorite IDs from the storage service.
    private func loadFavorites() {
        self.favoriteRecipeIDs = FavoritesStorageService.loadFavorites()
    }
    
    // Add a recipe to favorites.
    func addFavorite(_ recipeId: UUID) {
        // Update the local set first for immediate UI feedback.
        let (inserted, _) = favoriteRecipeIDs.insert(recipeId)
        
        // If it was a new favorite, persist the change.
        if inserted {
            FavoritesStorageService.addFavorite(recipeId) // Service handles saving
        }
    }
    
    // Remove a recipe from favorites.
    func removeFavorite(_ recipeId: UUID) {
        // Update the local set first.
        if favoriteRecipeIDs.remove(recipeId) != nil {
            // If removal was successful, persist the change.
            FavoritesStorageService.removeFavorite(recipeId) // Service handles saving
        }
    }
    
    // Check if a specific recipe is favorited.
    func isFavorite(recipeId: UUID) -> Bool {
        return favoriteRecipeIDs.contains(recipeId)
    }
    
    // Convenience function to toggle favorite status for a recipe.
    func toggleFavorite(recipeId: UUID) {
        if isFavorite(recipeId: recipeId) {
            removeFavorite(recipeId)
        } else {
            addFavorite(recipeId)
        }
    }
} 