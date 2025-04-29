import SwiftUI

struct FavoritesView: View {
    
    // Access the shared ViewModels needed by FavoritesScreenViewModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // StateObject for the view-specific ViewModel
    @StateObject private var viewModel: FavoritesScreenViewModel
    
    // Custom initializer to inject shared ViewModels
    init(recipeViewModel: RecipeViewModel, favoritesViewModel: FavoritesViewModel) {
        _viewModel = StateObject(wrappedValue: FavoritesScreenViewModel(recipeViewModel: recipeViewModel, favoritesViewModel: favoritesViewModel))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Check if there are any favorites
                if viewModel.favoriteRecipes.isEmpty {
                    VStack {
                        Spacer()
                        Image(systemName: "heart.slash") // Or another appropriate empty state icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.theme.textPlaceholder)
                        Text("No Favorites Yet")
                            .font(.appTitle)
                            .foregroundColor(.theme.textPlaceholder)
                        Text("Tap the heart on a recipe to save it here.")
                            .font(.standardLabel)
                            .foregroundColor(.theme.textPlaceholder)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Spacer()
                    }
                    .padding(.vertical, 50) // Add padding to center vertically
                } else {
                    // Display favorite recipes using RecipeCardView
                    LazyVStack(spacing: .spacingLarge) {
                        ForEach(viewModel.favoriteRecipes) { recipe in // Iterate over actual Recipe objects
                            // NavigationLink to RecipeDetailView
                            NavigationLink(destination: 
                                RecipeDetailView(recipe: recipe)
                                    // Inject FavoritesViewModel needed by detail view
                                    .environmentObject(favoritesViewModel) 
                            ) {
                                // Use RecipeCardView for display - need to construct a RecipeMatchResult
                                // For favorites, we assume they are 'full match' conceptually
                                let matchResult = RecipeMatchResult(recipe: recipe, missingIngredients: [])
                                RecipeCardView(result: matchResult)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
            .navigationTitle("Favorites")
        }
    }
}

// Preview Provider
#if DEBUG
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        // Create necessary ViewModels for preview
        let recipeViewModel = RecipeViewModel()
        let favoritesViewModel = FavoritesViewModel()
        let pantryViewModel = PantryViewModel() // Needed by HomeView/ContentView
        
        // Add a sample favorite for preview
        if let firstRecipe = recipeViewModel.recipes.first {
            favoritesViewModel.addFavorite(firstRecipe.id)
        }
        if recipeViewModel.recipes.count > 2 {
             favoritesViewModel.addFavorite(recipeViewModel.recipes[2].id)
        }

        // Return the view, injecting all necessary environment objects
        return FavoritesView(recipeViewModel: recipeViewModel, favoritesViewModel: favoritesViewModel)
            .environmentObject(recipeViewModel)
            .environmentObject(favoritesViewModel)
            .environmentObject(pantryViewModel) // Inject pantry too
    }
}
#endif 