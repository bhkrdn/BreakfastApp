# Project: Core Logic

## Tasks

### 1. Implement Recipe Matching Logic
- [x] Create `RecipeMatcherService.swift` (in `Helpers`).
- [x] Function `findMatchingRecipes(pantryIngredients: Set<String>, allRecipes: [Recipe])` -> `[RecipeMatchResult]`.
- [x] Define `RecipeMatchResult` struct: `recipe: Recipe`, `missingIngredients: [String]`, `matchType: MatchType` (e.g., `.full`, `.missingOne`, `.missingMany`).
- [x] Logic should efficiently compare pantry ingredients (case-insensitive) with recipe ingredients.
- [x] Sort results: Full matches first, then missing one, then potentially others.

### 2. Implement "Missing Ingredient" Logic
- [x] Ensure the `findMatchingRecipes` function correctly identifies recipes with exactly one missing ingredient and populates `RecipeMatchResult.missingIngredients`.
- [ ] The UI will use this data directly.

### 3. Integrate Favorites System Logic
- [x] Ensure ViewModels can access the `FavoritesViewModel` / `FavoritesStorageService`.
- [x] Provide functions in ViewModels to toggle favorite status for a given recipe.
- [x] Filter recipe lists based on favorite status where needed (e.g., Favorites View). 