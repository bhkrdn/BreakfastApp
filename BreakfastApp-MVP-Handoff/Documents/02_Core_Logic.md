# Project: Core Logic

## Tasks

### 1. Implement Recipe Matching Logic
- [ ] Create `RecipeMatcherService.swift` (or integrate into `HomeViewModel`).
- [ ] Function `findMatchingRecipes(pantryIngredients: Set<String>, allRecipes: [Recipe])` -> `[RecipeMatchResult]`.
  - Define `RecipeMatchResult` struct: `recipe: Recipe`, `missingIngredients: [String]`, `matchType: MatchType` (e.g., `.full`, `.missingOne`, `.missingMany`).
- [ ] Logic should efficiently compare pantry ingredients (case-insensitive) with recipe ingredients.
- [ ] Sort results: Full matches first, then missing one, then potentially others.

### 2. Implement "Missing Ingredient" Logic
- [ ] Ensure the `findMatchingRecipes` function correctly identifies recipes with exactly one missing ingredient and populates `RecipeMatchResult.missingIngredients`.
- [ ] The UI will use this data directly.

### 3. Integrate Favorites System Logic
- [ ] Ensure ViewModels can access the `FavoritesViewModel` / `FavoritesService`.
- [ ] Provide functions in ViewModels to toggle favorite status for a given recipe.
- [ ] Filter recipe lists based on favorite status where needed (e.g., Favorites View). 