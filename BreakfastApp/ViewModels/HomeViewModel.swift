import Foundation
import Combine

/// ViewModel for the Home screen (Recipe Suggestions).
/// Orchestrates fetching recipes and pantry items, performs matching, and publishes results for the view.
class HomeViewModel: ObservableObject {
    
    /// Published property holding the sorted recipe matching results for the `HomeView`.
    /// The view observes this property and updates automatically when it changes.
    @Published var recipeMatchResults: [RecipeMatchResult] = []
    
    // References to the shared ViewModels providing the source data.
    // These are typically injected via the Environment or initializer.
    private let recipeViewModel: RecipeViewModel
    private let pantryViewModel: PantryViewModel
    
    // Stores Combine subscriptions to keep them alive.
    private var cancellables = Set<AnyCancellable>()
    
    /// Initializes the ViewModel and sets up the Combine pipeline for recipe matching.
    /// - Parameters:
    ///   - recipeViewModel: The shared ViewModel holding all recipes.
    ///   - pantryViewModel: The shared ViewModel managing pantry ingredients.
    init(recipeViewModel: RecipeViewModel, pantryViewModel: PantryViewModel) {
        self.recipeViewModel = recipeViewModel
        self.pantryViewModel = pantryViewModel
        
        // Set up a Combine pipeline to react to changes in recipes or pantry items.
        Publishers.CombineLatest(recipeViewModel.$recipes, pantryViewModel.$pantryIngredients)
            // The `.map` operator transforms the upstream data (recipes, pantry items).
            // It's triggered whenever *either* recipes or pantry items change.
            .map { (allRecipes, pantryItems) -> [RecipeMatchResult] in
                // Call the static matching service function to get the results.
                // The service handles the core logic of comparison and sorting.
                RecipeMatcherService.findMatchingRecipes(pantryIngredients: pantryItems, allRecipes: allRecipes)
            }
            // Ensures the final assignment to `@Published` var happens on the main thread, safe for UI updates.
            .receive(on: RunLoop.main)
            // Assigns the output of the pipeline (the sorted `[RecipeMatchResult]`) to the `recipeMatchResults` property.
            // This automatically updates any views observing `recipeMatchResults`.
            // The `assign(to:)` subscriber manages its own lifecycle tied to the `@Published` property.
            .assign(to: &$recipeMatchResults)
    }
} 