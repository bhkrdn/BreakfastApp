import SwiftUI

struct HomeView: View {
    
    // Access the shared ViewModels needed by HomeViewModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var pantryViewModel: PantryViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel // Needed for Detail View injection
    
    // StateObject for the view-specific ViewModel
    // Initialized here, taking the shared ViewModels as dependencies
    @StateObject private var viewModel: HomeViewModel
    
    // Custom initializer to inject shared ViewModels into the StateObject
    init(recipeViewModel: RecipeViewModel, pantryViewModel: PantryViewModel) {
        _viewModel = StateObject(wrappedValue: HomeViewModel(recipeViewModel: recipeViewModel, pantryViewModel: pantryViewModel))
    }
    
    var body: some View {
        // Use NavigationStack for potential navigation to recipe details
        NavigationStack {
            // Use ScrollView for vertical scrolling of recipe cards
            ScrollView {
                // LazyVStack improves performance for long lists
                LazyVStack(spacing: .spacingLarge) {
                    // Iterate over the results published by the ViewModel
                    ForEach(viewModel.recipeMatchResults) { result in
                        // Wrap RecipeCardView in a NavigationLink
                        NavigationLink(destination: 
                            // Destination is the RecipeDetailView for the selected recipe
                            RecipeDetailView(recipe: result.recipe)
                                // Inject FavoritesViewModel into DetailView
                                .environmentObject(favoritesViewModel) 
                        ) {
                            // The link's label is the RecipeCardView itself
                            RecipeCardView(result: result)
                        }
                        // Make the NavigationLink less intrusive visually
                        .buttonStyle(PlainButtonStyle()) 
                    }
                }
                .padding(.horizontal) // Add horizontal padding to the list content
                .padding(.top) // Add padding at the top
            }
            // Set the background color for the entire view
            .background(Color.theme.background)
            // Set the navigation title
            .navigationTitle("Breakfast Ideas")
            // TODO: Add Search Bar here later if needed
        }
    }
}

// Preview Provider
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        // Create and configure the ViewModels *before* creating the view
        let recipeViewModel = RecipeViewModel()
        let pantryViewModel = PantryViewModel()
        let favoritesViewModel = FavoritesViewModel() // Create for preview
        
        // Add sample pantry items
        pantryViewModel.addIngredient("eggs")
        pantryViewModel.addIngredient("butter")
        pantryViewModel.addIngredient("salt")
        pantryViewModel.addIngredient("flour") // For the missing pancake ingredient
        
        // Now create the view instance and inject the pre-configured ViewModels
        return HomeView(recipeViewModel: recipeViewModel, pantryViewModel: pantryViewModel)
            .environmentObject(recipeViewModel)
            .environmentObject(pantryViewModel)
            .environmentObject(favoritesViewModel) // Inject for preview
    }
}
#endif 