@main
struct BreakfastAppApp: App {
    // Create a single instance of RecipeViewModel that persists for the app's lifecycle
    @StateObject private var recipeViewModel = RecipeViewModel()
    // Create a single instance of PantryViewModel
    @StateObject private var pantryViewModel = PantryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the ViewModels into the environment
                .environmentObject(recipeViewModel)
                .environmentObject(pantryViewModel)
        }
    }
} 