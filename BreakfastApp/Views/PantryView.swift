import SwiftUI

struct PantryView: View {
    
    // Access the shared PantryViewModel from the environment
    @EnvironmentObject var pantryViewModel: PantryViewModel
    
    // State for the text field used to add new ingredients
    @State private var newIngredientName: String = ""
    
    // Define the grid layout: adaptive columns, minimum width 100
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    // Static list of suggested ingredients - Updated from recipes.json and sorted by frequency
    private let suggestedIngredients = ["Eggs", "Bread", "Cheese", "Milk", "Butter", "Tomato", "Salt", "Pepper", "Honey", "Yogurt", "Banana", "Oats", "Spinach", "Olive oil", "Cucumber", "Lettuce", "Peanut butter", "Berries", "Granola", "Tortilla", "Sugar", "Cinnamon", "Egg", "Avocado", "Flour", "Onion", "Mayonnaise", "Strawberries", "Chia seeds", "Apple", "Cocoa powder", "Lemon", "Mango", "Olives", "Simit", "Bacon", "Bell pepper", "Blueberries", "Cream cheese", "Feta", "Green pepper", "Hummus", "Jam", "Labneh", "Mozzarella", "Nutella", "Nuts", "Parsley", "Sausage", "Thyme", "Tuna", "Vinegar", "Waffle mix", "Walnuts", "Za'atar", "Zucchini", "Açma", "Bagel", "Baking powder", "Bazlama bread", "Brie", "Chocolate chips", "Chili flakes", "Coconut milk", "Cottage cheese", "Croissant", "Dill", "Egg salad", "Greek yogurt", "Halloumi", "Ham", "Mixed fruits", "Muffin", "Mushrooms", "Olive paste", "Panini bread", "Phyllo dough", "Phyllo pastry", "Potatoes", "Protein powder", "Raisins", "Ricotta", "Sucuk", "Tomato paste", "Turkey slices"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) { // Use spacing 0 to control padding manually
                
                // Main scrollable area for the owned ingredient pills
                ScrollView {
                    // LazyVGrid for the responsive pill layout
                    LazyVGrid(columns: columns, spacing: 12) { // Add spacing between pills
                        // Sort the ingredients directly in the ForEach loop
                        ForEach(pantryViewModel.pantryIngredients.sorted(), id: \.self) { ingredient in
                            IngredientPillView(name: ingredient) { // Pass the onDelete closure
                                // Action to perform on delete
                                pantryViewModel.removeIngredient(ingredient)
                            }
                        }
                    }
                    .padding() // Add padding around the grid
                }
                
                Spacer() // Push the following content to the bottom
                
                Divider().padding(.horizontal) // Divider above suggestions
                
                // --- Bottom Section --- 
                
                // Wrap Title and ScrollView in an HStack
                HStack(alignment: .center, spacing: 8) { // Align items vertically centered
                    // Section Title for suggestions - REMOVED
                    /*
                    Text("Quick Add:") // Added colon for clarity
                        .font(.headline)
                        // .padding(.horizontal) // Padding handled by the outer HStack now
                        // .frame(maxWidth: .infinity, alignment: .leading) // Remove frame modifier
                    */
                    
                    // Horizontal scroll view for suggested ingredients
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(suggestedIngredients, id: \.self) { ingredient in
                                // Check if ingredient already exists in pantry
                                if !pantryViewModel.pantryIngredients.contains(where: { $0.caseInsensitiveCompare(ingredient) == .orderedSame }) {
                                    Button { // Action to add ingredient
                                        pantryViewModel.addIngredient(ingredient)
                                    } label: { // Pill appearance
                                        Text("+ \(ingredient)")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.theme.accent) // Orange text
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(
                                                RoundedRectangle(cornerRadius: 999)
                                                    .stroke(Color.theme.accent, lineWidth: 1) // Orange border
                                            )
                                    }
                                    .buttonStyle(.plain) // Use plain style to avoid default button background/tint
                                }
                            }
                        }
                        .padding(.horizontal) // Padding for the HStack content
                        .padding(.vertical, 8) // Add some vertical padding
                    }
                    // Remove frame modifier to let ScrollView take available space
                }
                .padding(.horizontal) // Add horizontal padding to the outer HStack
                .padding(.bottom, 4) // Add some space below the suggestions
                
                // Section to add new ingredients (Now at the very bottom)
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
                .padding(.horizontal) // Keep horizontal padding
                .padding(.vertical, .spacingSmall) // Use small vertical padding (e.g., 8.0)
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
        pantryViewModel.addIngredient("Flour") // Add more for grid testing
        pantryViewModel.addIngredient("Sugar")
        pantryViewModel.addIngredient("Baking Soda")
        
        // Now return the view, injecting the configured ViewModel
        return PantryView()
            .environmentObject(pantryViewModel)
            .environmentObject(RecipeViewModel())
            .environmentObject(FavoritesViewModel())
    }
}
#endif 