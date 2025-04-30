# Future Improvements (Post-MVP)

## Strategic Questions / Future Direction
<!--
User prompt regarding strategic direction:
"also there is a big question. who is the user. recently i was thinking, who would even open up a breakfast app every morning. this led me to other 2 questions: *which type of user (profile) opens the breakfast app everyday? *making those breakfasts are not hard and user will remember to do same breakfast for the next day till they got bored. So, what could be the reasons for opening the app everyday, even different times duriing the day? and this leads to another question: *should we add new major/minor features (like turning into some kind of healthy hub w/out getting to distant from our core)? add those as well"
-->
- [ ] Define the target user profile: Who opens a breakfast app daily? What are their motivations?
- [ ] Address user retention: Why would users return daily/regularly, considering breakfast simplicity and recipe repetition?
- [ ] Explore expanding the app's scope: Should we add new features (minor/major)? Could it evolve into a broader "healthy hub" while retaining the breakfast core?

This file tracks potential features and enhancements for future versions of the Breakfast App.

## UI Enhancements
- [ ] Implement custom floating/rounded `TabView` component.
- [ ] Implement actual recipe image loading/display in `RecipeCardView`.
- [ ] Implement multi-image horizontal scroll view in `RecipeCardView` (if multiple images exist for a recipe).
    - *Detail: Display card as usual; if >1 image exists, make the image area horizontally scrollable.*
- [ ] Add animations and transitions for a smoother UX.
- [ ] Add support for custom fonts (Poppins/Inter).
- [ ] Implement a custom splash screen (`LaunchScreen.swift`).
- [ ] Review and refine `RecipeDetailView` layout and styling against mockups/design guide.
- [ ] Review and refine `PantryView` layout and styling (e.g., text field, list appearance).
- [ ] Update Home screen layout to emphasize the first recipe card.
    - *Idea: Make the first recipe card bigger to nudge the user towards it, keeping others the same size.*
- [ ] Explore alternative Home screen designs/logic.
    - *Idea: Convert the current main page into a 'Browse' page and create a new main page that recommends the best option, potentially using background logic or user choices.*

## Data & Logic
- [ ] Migrate storage from `UserDefaults` to CoreData or another persistent solution.
- [ ] Update `recipes.json` with accurate `prepTime` values and detailed instructions.
- [ ] Add detailed descriptions to recipes in `recipes.json`.
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