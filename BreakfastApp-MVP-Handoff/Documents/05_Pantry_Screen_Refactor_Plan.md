# 📝 05 - Pantry Screen Refactor Implementation Plan

## 🎯 Goal
Refactor the `PantryView` to use a responsive, pill-based layout as specified in the `Pantry_Screen_Handoff.md` document, replacing the current list view and adding new UI elements.

## 📂 Files Involved
- **Create:** `BreakfastApp/Views/Components/IngredientPillView.swift` (assuming a `Components` subfolder exists or will be created)
- **Modify:** `BreakfastApp/Views/PantryView.swift`
- **Reference:** `BreakfastApp-MVP-Handoff/Xcode-Setup/Pantry_Screen_Handoff.md`
- **Reference:** `BreakfastApp-MVP-Handoff/Xcode-Setup/UI-Style-Guide.md`

## ✅ Task Breakdown

### 1. Create `IngredientPillView` Component
-   [x] Create the new file `IngredientPillView.swift`.
-   [x] Implement the `IngredientPillView` struct according to the specification in the handoff document:
    -   [x] `HStack` layout.
    -   [x] Orange circle indicator (`Color.theme.accent`).
    -   [x] Capitalized ingredient name (`.font(.system(size: 14, weight: .medium))`, `Color.theme.textPrimary`).
    -   [x] Inline trash button (`Image(systemName: "trash")`, `.foregroundColor(.gray)`).
    -   [x] Padding (`.horizontal, 12`, `.vertical, 6`).
    -   [x] Background (`Color.white`), rounded corners (`.cornerRadius(999)`).
    -   [x] Shadow (`.shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)`).
    -   [x] Flexible sizing (`.fixedSize(horizontal: false, vertical: true)`).
    -   [x] `onDelete: () -> Void` callback parameter.

### 2. Implement Flexible Pill Layout
-   [x] Choose and implement a Flow Layout structure (e.g., using a third-party library like `FlowStack` or building a custom layout container) within `PantryView.swift`.
-   [x] Define appropriate horizontal and vertical spacing for the pills within the layout (e.g., H: 8-12px, V: 12-16px).

### 3. Update `PantryView.swift`
-   [x] Remove the existing SwiftUI `List` and `.onDelete` modifier.
-   [x] Integrate the Flow Layout container.
-   [x] Iterate over `pantryViewModel.pantryIngredients` within the Flow Layout.
-   [x] For each ingredient, display an `IngredientPillView`.
-   [x] Connect the `onDelete` action of each `IngredientPillView` to `pantryViewModel.removeIngredient(ingredientName)`.

### 4. Add Smart Suggested Pills Section
-   [x] Add a horizontal `ScrollView` near the bottom (above input).
-   [x] Define a comprehensive list of suggested ingredients, sourced from `recipes.json` and sorted by frequency.
-   [x] Create pills for suggestions with the specified style: border-only, orange text (`#FF8C32`), rounded. Prepend "+" to the text (e.g., "+ Eggs"). Filter out ingredients already in the pantry.
-   [x] Implement tap action on suggestion pills to call `pantryViewModel.addIngredient()`.

### 5. Add Pantry Summary Pill
-   [ ] Add a non-clickable pill displaying summary text (e.g., "You can make 3 recipes now").
    -   *Note: Logic for calculating the number of recipes needs to be implemented, potentially in `PantryViewModel` or fetched from `RecipeViewModel`.*
-   [ ] Style the summary pill: Light blue background (`#E0F0FF` - check `Color.theme` for a matching color or add it), dark gray text (`Color.theme.textPrimary` or similar).
-   [ ] Position this pill appropriately (e.g., above the main ingredient pills).

### 6. Relocate Ingredient Input Section
-   [x] Move the `HStack` containing the `TextField` and "Add" `Button` to the bottom of the main `VStack` in `PantryView`.
-   [x] Ensure it remains visually accessible and doesn't overlap with the bottom navigation bar (consider safe area). Use `Spacer()` if needed.

### 7. Styling & Testing
-   [ ] Ensure all new elements conform to the `UI-Style-Guide.md`.
-   [ ] Test adding ingredients via text input.
-   [ ] Test adding ingredients via suggested pills.
-   [ ] Test deleting ingredients via the inline trash icon.
-   [ ] Test layout responsiveness with varying numbers of ingredients and ingredient name lengths.
-   [ ] Verify visual consistency (colors, fonts, spacing). 