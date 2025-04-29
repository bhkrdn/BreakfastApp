import Foundation
import Combine // Needed for ObservableObject and @Published

class RecipeViewModel: ObservableObject {
    
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        loadRecipes()
    }
    
    private func loadRecipes() {
        // Use the static function from DataLoadingService
        self.recipes = DataLoadingService.loadRecipes()
        
        // Basic check after loading
        if recipes.isEmpty {
            print("Warning: No recipes were loaded. Check recipes.json and DataLoadingService.")
        }
    }
    
    // Optional: Function to find a specific recipe by ID if needed later
    func recipe(withId id: UUID) -> Recipe? {
        return recipes.first { $0.id == id }
    }
} 