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
- [ ] Create `HomeView.swift` and `HomeViewModel.swift`.
- [ ] `HomeViewModel`: Load recipes, get pantry items, use `RecipeMatcherService`, publish `[RecipeMatchResult]`.
- [ ] `HomeView`: Display `RecipeCardView`s in a `ScrollView` or `List`.
- [ ] Implement Search Bar filtering (if required on this screen).
- [ ] Wrap `HomeView` in `NavigationStack` for navigation.
- [ ] Navigate to `RecipeDetailView` on card tap.

### 4. Implement Recipe Detail View
- [ ] Create `RecipeDetailView.swift` and `RecipeDetailViewModel.swift`.
- [ ] Input: `Recipe`.
- [ ] Display large image, title, tags, prep time, ingredients list, instructions (placeholder text).
- [ ] Add Favorite toggle button (e.g., heart icon) connected to `FavoritesViewModel`.
- [ ] Style according to mockups/guide.

### 5. Implement Pantry Management View
- [ ] Create `PantryView.swift` and `PantryViewModel.swift`.
- [ ] `PantryViewModel`: Inject/access `PantryService`, publish pantry ingredients list.
- [ ] `PantryView`: Display ingredients in a `List`.
- [ ] Add Text Field and Button to add ingredients.
- [ ] Implement swipe-to-delete for removing ingredients.
- [ ] Add Search Bar to filter displayed ingredients.
- [ ] Style according to mockups/guide.

### 6. Implement Favorites View
- [ ] Create `FavoritesView.swift` and `FavoritesViewModel.swift`.
- [ ] `FavoritesViewModel`: Inject/access `FavoritesService` and `RecipeService`, publish favorite `[Recipe]` list.
- [ ] `FavoritesView`: Display favorite recipes using `RecipeCardView`s.
- [ ] Wrap in `NavigationStack`.
- [ ] Navigate to `RecipeDetailView` on card tap.

### 7. Setup Main App Structure and Navigation
- [ ] Create `ContentView.swift`.
- [ ] Set up `TabView` containing `HomeView`, `PantryView`, `FavoritesView`.
- [ ] Instantiate and inject necessary ViewModels/Services (`@StateObject`, `.environmentObject`).
- [ ] Ensure `NavigationStack` is correctly placed for each tab that needs it. 