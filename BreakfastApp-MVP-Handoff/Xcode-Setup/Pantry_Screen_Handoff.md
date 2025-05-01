
# 🛠️ Pantry Screen – Handoff Overview (Pill-Based Layout)

## 🎯 Purpose
Update the Pantry screen with a responsive, modern layout using ingredient pills that fit many items per row and visually match the app’s cozy style.

---

## 🔄 What Will Change

| Area                  | Current                        | New Design                                                             |
|------------------------|----------------------------------|------------------------------------------------------------------------|
| Component Name         | IngredientRow / list items       | `IngredientPillView` (formerly `IngredientCapsuleView`)               |
| Layout                 | Single-column List               | Responsive multi-pill layout using flexible wrapping (Flow Layout)     |
| Delete Behavior        | Swipe-to-delete                  | Inline trash icon (on the right side of each pill)                     |
| Input Section Position | Above the list                   | Docked at the bottom                                                   |

---

## 🆕 New Items to be Added

### ✅ Smart Suggested Pills
- **Component**: Horizontal `ScrollView` of pills like `+ Eggs`, `+ Milk`
- **Style**: Border only, orange text (`#FF8C32`), rounded, lightweight
- **Interaction**: Tap to add the ingredient

### ✅ Pantry Summary Pill
- **Component**: Non-clickable pill
- **Text**: `"You can make 3 recipes now"`
- **Style**: Light blue background (`#E0F0FF`), dark gray text

---

## 🍳 `IngredientPillView` Component Specification

```swift
struct IngredientPillView: View {
    let name: String
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(Color.theme.accent) // Orange
                .frame(width: 20, height: 20)

            Text(name.capitalized)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.theme.textPrimary)
                .lineLimit(1)

            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.gray)
                    .imageScale(.small)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.white)
        .cornerRadius(999)
        .fixedSize(horizontal: false, vertical: true) // Let pill grow based on content
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
    }
}
```

- **Width**: Flexible based on ingredient name
- **Min Width**: Use `.frame(minWidth: 80)` if needed
- **Height**: Consistent with vertical padding

---

## 📐 Layout & Behavior Notes

- **Grid Type**: Use a `FlowLayout` or `LazyVStack` with `.alignment(.leading)` and pill wrapping
- **Category Groups**: Optional headers like `Dairy`, `Fruits`, etc.
- **Spacing**: Horizontal ~8–12px, vertical ~12–16px

---

## 🧠 Developer Notes

- Rename `IngredientCapsuleView` → `IngredientPillView`
- Pills must support **variable width**
- Avoid fixed `.frame(width:)` values
- Delete handled via `onDelete` callback
- Continue using `addIngredient()` and `removeIngredient()` from ViewModel
