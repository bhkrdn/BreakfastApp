import SwiftUI

@main
struct BreakfastAppApp: App {
    // Create ViewModels as StateObjects to persist across view updates
    @StateObject private var recipeViewModel = RecipeViewModel()
    @StateObject private var pantryViewModel = PantryViewModel()
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    // Add state to track if we should show the splash screen
    @State private var showingSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    // Inject the ViewModels into the environment for access by descendant views
                    .environmentObject(recipeViewModel)
                    .environmentObject(pantryViewModel)
                    .environmentObject(favoritesViewModel)
                    .opacity(showingSplash ? 0 : 1)
                
                if showingSplash {
                    SplashView(isActive: $showingSplash)
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: showingSplash)
        }
    }
} 