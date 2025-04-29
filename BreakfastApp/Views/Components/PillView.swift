import SwiftUI

/// A reusable view that displays text within a rounded rectangle shape, like a pill or capsule.
struct PillView: View {
    let text: String
    let font: Font
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat = 5 // Standard corner radius for pills
    let verticalPadding: CGFloat = 4
    let horizontalPadding: CGFloat = .spacingSmall // Use defined constant
    
    var body: some View {
        Text(text)
            .font(font)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
    }
}

// MARK: - Preview

#if DEBUG
struct PillView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .spacingMedium) {
            // Example for a recipe tag
            PillView(
                text: "High Protein",
                font: .detailText,
                textColor: .theme.accent,
                backgroundColor: .theme.accent.opacity(0.2)
            )
            
            // Example for the missing ingredient label
            PillView(
                text: "Missing Milk",
                font: .missingIngredient,
                textColor: .theme.textPrimary,
                backgroundColor: .theme.missingIngredientLabel
            )
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
#endif 