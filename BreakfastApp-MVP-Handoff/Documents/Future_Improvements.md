# Future Improvements (Post-MVP)

This file tracks potential features and enhancements for future versions of the Breakfast App.

## UI Enhancements
- [ ] Implement custom floating/rounded `TabView` component.
- [ ] Implement actual recipe image loading/display in `RecipeCardView`.
- [ ] Add animations and transitions for a smoother UX.
- [ ] Add support for custom fonts (Poppins/Inter).
- [ ] Implement a custom splash screen (`LaunchScreen.swift`).
- [ ] Review and refine `RecipeDetailView` layout and styling against mockups/design guide.

## Data & Logic
- [ ] Migrate storage from `UserDefaults` to CoreData or another persistent solution.
- [ ] Update `recipes.json` with accurate `prepTime` values and detailed instructions.
- [ ] Define and use a dedicated `Ingredient.swift` model (e.g., with quantity, category).
- [ ] Implement more robust error handling for data loading/decoding.
- [ ] Add logic to filter/hide recipes with many missing ingredients (e.g., `MatchType.notEnough`).

## Features
- [ ] Implement Search Bar filtering on Home screen (`HomeView`).
- [ ] Implement Search Bar filtering on Pantry screen (`PantryView`).
- [ ] Display full recipe instructions on `RecipeDetailView`.
- [ ] Add Settings screen.
- [ ] Add User Profile screen.
- [ ] Add Shopping List feature.

## Testing
- [ ] Increase unit test coverage, including edge cases for services and ViewModels.
- [ ] Implement comprehensive UI tests for key user flows. 