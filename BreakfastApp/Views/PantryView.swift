import SwiftUI

struct PantryView: View {
    
    // Access the shared PantryViewModel from the environment
    @EnvironmentObject var pantryViewModel: PantryViewModel
    
    // State for the text field used to add new ingredients
    @State private var newIngredientName: String = ""
    
    // Computed property for sorted ingredients to simplify delete logic
    private var sortedIngredients: [String] {
        pantryViewModel.pantryIngredients.sorted()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // List to display current pantry ingredients
                List {
                    // Iterate over the computed sorted array
                    ForEach(sortedIngredients, id: \.self) { ingredient in
                        Text(ingredient.capitalized)
                            .font(.standardLabel)
                            .foregroundColor(.theme.textPrimary)
                    }
                    // Add the .onDelete modifier here
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain) // Use plain style to better match the design
                
                // Section to add new ingredients
                HStack {
                    TextField("Add ingredient...", text: $newIngredientName)
                        .font(.standardLabel)
                        .padding(.leading) // Add padding inside the TextField
                        .frame(height: 44) // Ensure tappable height
                        .background(Color.theme.navBackground) // White background
                        .cornerRadius(10)
                    
                    Button {
                        addIngredient()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.theme.accent)
                    }
                    .disabled(newIngredientName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) // Disable if text field is empty
                }
                .padding() // Padding around the add ingredient section
            }
            .navigationTitle("Pantry")
            .background(Color.theme.background.ignoresSafeArea()) // Set background color
        }
    }
    
    // Function to handle adding the ingredient
    private func addIngredient() {
        pantryViewModel.addIngredient(newIngredientName)
        newIngredientName = "" // Clear the text field
    }
    
    // Function to handle deleting items from the list
    private func deleteItems(at offsets: IndexSet) {
        // Get the sorted list used by ForEach
        let ingredientsToDelete = offsets.map { sortedIngredients[$0] }
        
        // Iterate through the names and call the ViewModel's remove function
        for ingredientName in ingredientsToDelete {
            pantryViewModel.removeIngredient(ingredientName)
        }
    }
}

// Preview Provider
#if DEBUG
struct PantryView_Previews: PreviewProvider {
    static var previews: some View {
        // Create and configure the ViewModel *before* creating the view
        let pantryViewModel = PantryViewModel()
        pantryViewModel.addIngredient("Eggs")
        pantryViewModel.addIngredient("Milk")
        pantryViewModel.addIngredient("Butter")
        
        // Now return the view, injecting the configured ViewModel
        return PantryView()
            .environmentObject(pantryViewModel)
            .environmentObject(RecipeViewModel())
            .environmentObject(FavoritesViewModel())
    }
}
#endif 