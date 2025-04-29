import SwiftUI

@main
struct BreakfastAppApp: App {
    // Create ViewModels as StateObjects to persist across view updates
    @StateObject private var recipeViewModel = RecipeViewModel()
    @StateObject private var pantryViewModel = PantryViewModel()
    @StateObject private var favoritesViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the ViewModels into the environment for access by descendant views
                .environmentObject(recipeViewModel)
                .environmentObject(pantryViewModel)
                .environmentObject(favoritesViewModel)
        }
    }
} 