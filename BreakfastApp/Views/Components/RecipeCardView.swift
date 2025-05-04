import SwiftUI

struct RecipeCardView: View {
    
    let result: RecipeMatchResult
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) { // Use spacing 0 and manage padding manually
            // Use the actual image name from the recipe, or fallback to placeholder
            Image(result.recipe.imageName ?? "fallback_image") // Use image name, fallback to system icon
                .resizable()
                .aspectRatio(contentMode: .fill)
                // Clip the top part of the image to have rounded corners
                .frame(height: 150) // Example height, adjust as needed
                .clipped()
            
            // Content below the image
            VStack(alignment: .leading, spacing: .spacingSmall) {
                // Recipe Title
                Text(result.recipe.name)
                    .font(.prominentName) // Use defined font style
                    .foregroundColor(.theme.textPrimary)
                
                // Use PillView for tags
                HStack {
                    ForEach(result.recipe.tags.prefix(3), id: \.self) { tag in // Show max 3 tags
                        PillView(text: tag, 
                                 font: .detailText, 
                                 textColor: .theme.accent, 
                                 backgroundColor: .theme.accent.opacity(0.2))
                    }
                }
                
                // Prep Time
                HStack {
                    Image(systemName: "timer")
                    Text("\(result.recipe.prepTime) min")
                }
                .font(.detailText)
                .foregroundColor(.theme.textPlaceholder)
                
                // Use PillView for Missing Ingredient Label (Conditional)
                if result.matchType == .missingOne, let missing = result.missingIngredients.first {
                    PillView(text: "Missing \(missing)", 
                             font: .missingIngredient, 
                             textColor: .theme.textPrimary, 
                             backgroundColor: .theme.missingIngredientLabel)
                    .padding(.top, .spacingSmall) // Add some space above
                }
            }
            .padding(.horizontal, .spacingMedium) // Padding for the text content
            .padding(.vertical, .spacingSmall)
            
        }
        // Styling for the card itself
        .background(Color.theme.navBackground) // Use white background for the card
        .cornerRadius(15) // Apply rounded corners to the whole card
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2) // Subtle shadow
        .padding(.vertical, .spacingSmall) // Add some vertical space around cards
    }
}

// Add a preview provider for easy testing in Xcode Canvas
#if DEBUG
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Create sample data directly in the preview, now including imageName
        let sampleRecipeFullMatch = Recipe(name: "Classic Scrambled Eggs", ingredients: ["eggs", "butter", "salt"], prepTime: 5, tags: ["High Protein", "Vegetarian"], imageName: "scrambled-eggs")
        let sampleResultFull = RecipeMatchResult(recipe: sampleRecipeFullMatch, missingIngredients: [])
        
        let sampleRecipeMissingOne = Recipe(name: "Pancakes", ingredients: ["flour", "milk", "egg", "sugar"], prepTime: 15, tags: ["Vegetarian"], imageName: nil)
        let sampleResultMissingOne = RecipeMatchResult(recipe: sampleRecipeMissingOne, missingIngredients: ["milk"])
        
        let sampleRecipeMissingMany = Recipe(name: "Complex Dish", ingredients: ["a", "b", "c", "d"], prepTime: 45, tags: ["Hard"], imageName: nil)
        let sampleResultMissingMany = RecipeMatchResult(recipe: sampleRecipeMissingMany, missingIngredients: ["c", "d"])

        ScrollView {
            VStack {
                RecipeCardView(result: sampleResultFull)
                RecipeCardView(result: sampleResultMissingOne)
                RecipeCardView(result: sampleResultMissingMany)
            }
            .padding()
        }
        .background(Color.theme.background)
    }
}
#endif 