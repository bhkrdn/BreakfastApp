# Project Structure Reference

This document mirrors the structure defined in `.cursor/rules/project-structure.mdc`.

```
BreakfastApp/
├── App/
│   ├── BreakfastAppApp.swift         # App entry point (TabView, ViewModel injection)
│   └── LaunchScreen.swift (optional) # Minimal splash screen view (If implemented)
├── Views/
│   ├── HomeView.swift                # Main Recipe Suggestions Screen
│   ├── RecipeDetailView.swift         # Detailed recipe page
│   ├── PantryView.swift               # Pantry ingredient management screen
│   ├── FavoritesView.swift            # Saved recipes list
│   └── Components/                    # Reusable view components (e.g., RecipeCardView, PillView)
├── Models/
│   ├── Recipe.swift                   # Recipe data model (Decodable, Identifiable)
│   ├── Ingredient.swift (optional)    # Ingredient model (if needed beyond String)
│   └── RecipeMatchResult.swift        # Structure for recipe matching results
├── ViewModels/
│   ├── HomeViewModel.swift            # Manages state for HomeView (recipe suggestions)
│   ├── RecipeDetailViewModel.swift    # Manages state for RecipeDetailView
│   ├── PantryViewModel.swift          # Manages state for PantryView (add/remove ingredients)
│   ├── FavoritesViewModel.swift       # Manages state for FavoritesView (saved recipes)
├── Resources/
│   └── recipes.json                   # Static recipe database
├── Helpers/                           # Utility classes, services, and extensions
│   ├── DataLoadingService.swift       # Handles loading recipes.json
│   ├── RecipeMatcherService.swift     # Logic for matching pantry ingredients to recipes
│   ├── PantryStorageService.swift     # Handles saving/loading pantry data (UserDefaults)
│   ├── FavoritesStorageService.swift  # Handles saving/loading favorites data (UserDefaults)
│   └── Extensions/                    # Swift extensions (e.g., Color+, Font+)
│       ├── Color+Extensions.swift
│       ├── Font+Extensions.swift
│       └── CGFloat+Extensions.swift
├── Assets.xcassets/                   # Images, icons, colors
│   ├── AppIcon.appiconset/
│   ├── LaunchScreen.imageset/
│   ├── RecipeImages/ (optional)       # Placeholder or actual recipe images
├── Preview Content/                   # Assets and data for SwiftUI Previews
│   └── Preview Assets.xcassets
└── SupportingFiles/                   # Configuration files
    └── Info.plist
```

---
## ✅ Key Organizational Rules

| Area       | Rule                                                                                    |
| ---------- | --------------------------------------------------------------------------------------- |
| Views      | All UI screens live in `/Views`, reusable components in `/Views/Components`             |
| Models     | All data structures (Recipe, RecipeMatchResult) live in `/Models`                       |
| ViewModels | State management & UI logic lives in `/ViewModels`, powered by `@ObservableObject`      |
| Resources  | Static data files (recipes.json) stay in `/Resources`                                   |
| Helpers    | Utility classes, services (data loading, matching, storage), extensions live in `/Helpers` |
| App Entry  | `BreakfastAppApp.swift` holds `TabView` & root ViewModel setup                          |

## 🧠 Why This Structure?

- **Modular:** Easy to add new features and screens.
- **Scalable:** Clear separation allows the app to grow.
- **Testable:** Services and ViewModels can be tested independently.
- **Maintainable:** Follows MVVM principles for clarity.
- **Developer-friendly:** Common structure easy to navigate.
