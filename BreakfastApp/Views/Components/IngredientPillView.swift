import SwiftUI

// Reusable view for displaying an ingredient as a pill with a delete button
struct IngredientPillView: View {
    let name: String
    let onDelete: () -> Void // Callback when the trash icon is tapped

    // Access the color theme
    // Note: Ensure Color+Theme.swift defines these colors based on UI-Style-Guide.md
    // E.g., Color.theme.accent (#FF8C32), Color.theme.textPrimary (#2E2E2E)

    var body: some View {
        HStack(spacing: 8) {
            // Orange circle indicator
            Circle()
                .fill(Color.theme.accent) // Use accent color from theme
                .frame(width: 10, height: 10) // Smaller circle size might look better

            // Ingredient name
            Text(name.capitalized)
                .font(.system(size: 14, weight: .medium)) // As specified
                .foregroundColor(Color.theme.textPrimary) // Use primary text color
                .lineLimit(1) // Prevent text wrapping
                .layoutPriority(1) // Give text higher priority to expand

            // Delete button
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.gray) // Standard gray for less emphasis
                    .imageScale(.small) // Smaller icon
            }
            .buttonStyle(.plain) // Ensure the button doesn't have extra styling
        }
        .padding(.horizontal, 12) // Horizontal padding
        .padding(.vertical, 6)    // Vertical padding
        .background(Color.theme.navBackground) // Use nav background (White: #FFFFFF) for the pill
        .cornerRadius(999) // Fully rounded corners
        .fixedSize(horizontal: false, vertical: true) // Allows height to adjust, width flexible
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1) // Subtle shadow
        // Consider adding a minimum width if very short names look odd
        // .frame(minWidth: 80)
    }
}

// Preview Provider for IngredientPillView
#if DEBUG
struct IngredientPillView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IngredientPillView(name: "Eggs", onDelete: { print("Delete Eggs") })
            IngredientPillView(name: "A very long ingredient name to test wrapping", onDelete: { print("Delete Long Name") })
        }
        .padding()
        .background(Color.theme.background) // Use app background for context
        // Make sure to inject necessary environment objects if the theme depends on them
        // .environmentObject(PantryViewModel()) // Example if theme needs it
    }
}
#endif 