import Foundation
import Combine // For ObservableObject and @Published

class PantryViewModel: ObservableObject {
    
    // Published property to hold the current pantry ingredients.
    // Views can subscribe to this to update automatically.
    @Published var pantryIngredients: Set<String> = []
    
    init() {
        // Load the saved pantry ingredients when the ViewModel is initialized.
        loadPantry()
    }
    
    // Load ingredients from the storage service and update the published property.
    private func loadPantry() {
        self.pantryIngredients = PantryStorageService.loadPantry()
    }
    
    // Add an ingredient to the pantry.
    func addIngredient(_ name: String) {
        // Normalize the ingredient name
        let normalizedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        // Only add non-empty ingredients
        guard !normalizedName.isEmpty else { return }
        
        // Insert into the local set first to update UI immediately
        let (inserted, _) = pantryIngredients.insert(normalizedName)
        
        // If the ingredient was actually new, save the updated pantry
        if inserted {
            PantryStorageService.savePantry(pantryIngredients)
        }
    }
    
    // Remove an ingredient from the pantry.
    func removeIngredient(_ name: String) {
        // Normalize the name for consistent removal
        let normalizedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        // Remove from the local set first to update UI immediately
        if pantryIngredients.remove(normalizedName) != nil {
            // If removal was successful, save the updated pantry
            PantryStorageService.savePantry(pantryIngredients)
        }
    }
    
    // Helper to check if an ingredient exists (case-insensitive)
    func containsIngredient(_ name: String) -> Bool {
        let normalizedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return pantryIngredients.contains(normalizedName)
    }
} 