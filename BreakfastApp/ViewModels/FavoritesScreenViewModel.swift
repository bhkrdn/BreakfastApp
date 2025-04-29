import Foundation
import Combine

class FavoritesScreenViewModel: ObservableObject {
    
    // Published list of recipes that are marked as favorites.
    @Published var favoriteRecipes: [Recipe] = []
    
    // Cancellables store for Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    // References to the shared ViewModels providing the source data.
    private let recipeViewModel: RecipeViewModel
    private let favoritesViewModel: FavoritesViewModel

    // Initializer receives the shared ViewModels as dependencies.
    init(recipeViewModel: RecipeViewModel, favoritesViewModel: FavoritesViewModel) {
        self.recipeViewModel = recipeViewModel
        self.favoritesViewModel = favoritesViewModel
        
        // Combine the latest values from both publishers.
        Publishers.CombineLatest(recipeViewModel.$recipes, favoritesViewModel.$favoriteRecipeIDs)
            // Use map to transform the combined output (all recipes and favorite IDs) into a filtered list.
            .map { (allRecipes, favoriteIDs) -> [Recipe] in
                // Filter the recipes where the ID is present in the favorite IDs set.
                allRecipes.filter { favoriteIDs.contains($0.id) }
                    // Sort the favorites alphabetically by name for consistent display.
                    .sorted { $0.name.localizedCompare($1.name) == .orderedAscending }
            }
            // Assign the filtered and sorted list to the published favoriteRecipes property.
            // Using assign(to: ...) ensures the assignment happens on the main thread automatically.
            .assign(to: &$favoriteRecipes)
            // No need to store this directly, as assign(to:) manages the subscription lifecycle tied to @Published.
            // If not using assign(to:), you would use .sink and store in cancellables.
    }
} 