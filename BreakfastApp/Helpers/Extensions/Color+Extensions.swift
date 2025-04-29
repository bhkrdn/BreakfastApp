import SwiftUI

// Extension to define custom colors used throughout the app, based on the UI Style Guide.
extension Color {
    
    // Usage: Color.theme.background
    static let theme = ColorTheme()
}

struct ColorTheme {
    // Main background color (#FDF7F2)
    let background = Color("AppBackground")
    
    // Navigation bar background (#FFFFFF)
    let navBackground = Color("NavBarBackground")
    
    // Primary accent color for icons, highlights (#FF8C32)
    let accent = Color("AccentColor")
    
    // Main text color for titles, labels (#2E2E2E)
    let textPrimary = Color("TextPrimary")
    
    // Placeholder text color (#9A9A9A)
    let textPlaceholder = Color("TextPlaceholder")
    
    // Background color for the missing ingredient label (#E0F0FF)
    let missingIngredientLabel = Color("MissingIngredientLabel")
}

// Helper to initialize Color from HEX string (optional, but useful if not using Asset Catalog)
/*
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0) // Default to an invalid color
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
*/ 