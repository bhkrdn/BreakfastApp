# Project: UI Implementation

## Tasks

### 1. Apply Global Styles
- [x] Define `Color` constants in `Color+Extensions.swift` based on `UI-Style-Guide.md` (`backgroundMain`, `accentPrimary`, `textTitle`, etc.).
- [x] Define `Font` constants/helper functions in `Font+Extensions.swift` (e.g., `.titleStyle()`, `.bodyStyle()`).
- [x] Define standard padding/spacing values (e.g., `CGFloat` constants).

### 2. Implement Common UI Components
- [x] Create `RecipeCardView.swift`.
  - [x] Input: `RecipeMatchResult`.
  - [x] Display image (use SF Symbol placeholder initially), title, tags, prep time.
  - [x] Conditionally display the light blue "Missing [Ingredient]" capsule (`#E0F0FF`) if `matchType == .missingOne`.
  - [x] Apply rounded corners, padding per style guide.
- [x] Create reusable `PillView.swift` for tags and missing ingredient label.
- [ ] Style the main `TabView`:
    - [x] Set background color (#FFFFFF).
    - [x] Set icon and label colors (#FF8C32, #2E2E2E).
    - [x] Use appropriate SF Symbols for icons (outline style).

### 3. Implement Home / Recipe Suggestions View
- [x] Create HomeView.swift and HomeViewModel.swift.
- [x] `HomeViewModel`: Load recipes, get pantry items, use `RecipeMatcherService`, publish `[RecipeMatchResult]`.
- [x] `HomeView`: Display `RecipeCardView`s in a `ScrollView` or `List`.
- [ ] Implement Search Bar filtering (if required on this screen).
- [x] Wrap `HomeView` in `NavigationStack` for navigation.
- [x] Navigate to `RecipeDetailView` on card tap.

### 4. Implement Recipe Detail View
- [x] Create `RecipeDetailView.swift` and RecipeDetailViewModel.swift.
- [x] Input: `Recipe`.
- [x] Display large image, title, tags, prep time, ingredients list, instructions (placeholder text).
- [x] Add Favorite toggle button (e.g., heart icon) connected to `FavoritesViewModel`.
- [x] Style according to mockups/guide.

### 5. Implement Pantry Management View
- [x] Create `PantryView.swift` and PantryViewModel.swift.
- [x] `PantryViewModel`: Inject/access PantryService, publish pantry ingredients list.
- [x] `PantryView`: Display ingredients in a `List`.
- [x] Add Text Field and Button to add ingredients.
- [x] Implement swipe-to-delete for removing ingredients.
- [ ] Add Search Bar to filter displayed ingredients.
- [x] Style according to mockups/guide.

### 6. Implement Favorites View
- [x] Create `FavoritesView.swift` and `FavoritesViewModel.swift`.
- [x] `FavoritesViewModel`: Inject/access FavoritesService and RecipeService, publish favorite `[Recipe]` list.
- [x] `FavoritesView`: Display favorite recipes using `RecipeCardView`s.
- [x] Wrap in `NavigationStack`.
- [x] Navigate to `RecipeDetailView` on card tap.

### 7. Setup Main App Structure and Navigation
- [x] Create `ContentView.swift`.
- [x] Set up `TabView` containing `HomeView`, `PantryView`, `FavoritesView`.
- [x] Instantiate and inject necessary ViewModels/Services (`@StateObject`, `.environmentObject`).
- [x] Ensure `NavigationStack` is correctly placed for each tab that needs it. 