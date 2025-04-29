# Project: Data Management

## Tasks

### 1. Define Data Models
- [x] Create `Recipe.swift` struct conforming to `Decodable` and `Identifiable`.
  - [x] Properties: `id` (UUID, generate on decode), `name` (String), `ingredients` ([String]), `prepTime` (Int), `tags` ([String]), `imageName` (String, optional - map from recipe name or add to JSON).
- [ ] Create `Ingredient.swift` (Consider if needed beyond String, maybe for pantry status).

### 2. Implement Recipe Loading
- [x] Create `DataLoadingService.swift` (in `Helpers`).
- [x] Add function `load<T: Decodable>(_ filename: String) -> T` to load and decode JSON from the bundle.
- [x] Handle potential file reading and JSON decoding errors gracefully.
- [x] Store loaded recipes in a property accessible to ViewModels (e.g., `@StateObject` in main view or singleton).

### 3. Implement Pantry Storage (UserDefaults for MVP)
- [x] Create `PantryStorageService.swift` (in `Helpers`).
- [x] Use UserDefaults for pantry storage (Set<String>).
- [x] Implement `addIngredient`, `removeIngredient`.
- [x] Ensure consistent ingredient name casing/trimming.
- [x] Create `PantryViewModel.swift` (as `@StateObject` or `@EnvironmentObject`).
- [x] Implement `getPantryIngredients()` (or make the stored property `@Published` in ViewModel).

### 4. Implement Favorites Storage (UserDefaults for MVP)
- [x] Create `FavoritesStorageService.swift` (in `Helpers`).
- [x] Use UserDefaults for favorite recipe IDs (Set<UUID>).
- [x] Implement `addFavorite`, `removeFavorite`.
- [x] Implement `isFavorite(recipeId: UUID) -> Bool`.
- [x] Create `FavoritesViewModel.swift`.
- [x] Make favorite status available reactively (in ViewModel). 