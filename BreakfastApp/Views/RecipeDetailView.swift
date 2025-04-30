import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    // Access the shared favorites ViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // Computed property to check if the current recipe is a favorite
    private var isFavorite: Bool {
        favoritesViewModel.isFavorite(recipeId: recipe.id)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .spacingMedium) {
                // Load image using imageName, fallback to placeholder
                Image(recipe.imageName ?? "photo") // Use image name or system icon fallback
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250) // Larger image for detail view
                    .clipped()
                
                // Main content padding
                VStack(alignment: .leading, spacing: .spacingLarge) {
                    // Title
                    Text(recipe.name)
                        .font(.appTitle)
                        .foregroundColor(.theme.textPrimary)
                    
                    // Tags
                    HStack {
                        ForEach(recipe.tags.prefix(4), id: \.self) { tag in // Show more tags
                            PillView(text: tag,
                                     font: .detailText,
                                     textColor: .theme.accent,
                                     backgroundColor: .theme.accent.opacity(0.2))
                        }
                    }
                    
                    // Prep Time
                    HStack {
                        Image(systemName: "timer")
                        Text("Prep Time: \(recipe.prepTime) min")
                    }
                    .font(.standardLabel) // Slightly larger font for detail
                    .foregroundColor(.theme.textPlaceholder)
                    
                    // Ingredients Section
                    VStack(alignment: .leading, spacing: .spacingSmall) {
                        Text("Ingredients")
                            .font(.prominentName)
                            .foregroundColor(.theme.textPrimary)
                        
                        // List ingredients
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            HStack {
                                Image(systemName: "circle.fill") // Simple bullet point
                                    .font(.system(size: 8))
                                    .foregroundColor(.theme.accent)
                                Text(ingredient.capitalized)
                                    .font(.standardLabel)
                            }
                        }
                    }
                    
                    // Instructions Section (Placeholder)
                    VStack(alignment: .leading, spacing: .spacingSmall) {
                        Text("Instructions")
                            .font(.prominentName)
                            .foregroundColor(.theme.textPrimary)
                        Text("Detailed cooking instructions will go here...")
                            .font(.standardLabel)
                            .foregroundColor(.theme.textPrimary.opacity(0.8))
                    }
                }
                .padding(.horizontal) // Add horizontal padding for the content section
                
            }
        }
        .navigationTitle(recipe.name) // Set title dynamically
        .navigationBarTitleDisplayMode(.inline) // Keep title small in nav bar
        .background(Color.theme.background) // Set background for the whole scroll view area
        // Add toolbar items
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // Toggle favorite status using the ViewModel
                    favoritesViewModel.toggleFavorite(recipeId: recipe.id)
                } label: {
                    // Show different icon based on favorite status
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.theme.accent) // Use theme accent color
                }
            }
        }
    }
}

// Preview Provider
#if DEBUG
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Use a manually created sample recipe with an image name for robust previewing
        let sampleRecipeWithImage = Recipe(name: "Classic Scrambled Eggs", 
                                         ingredients: ["eggs", "butter", "salt", "pepper"], 
                                         prepTime: 5, 
                                         tags: ["High Protein", "Vegetarian"], 
                                         imageName: "scrambled-eggs")
        
        NavigationStack { // Wrap in NavigationStack for previewing title
            RecipeDetailView(recipe: sampleRecipeWithImage)
                .environmentObject(FavoritesViewModel()) // Inject for potential future use
        }
    }
}
#endif 