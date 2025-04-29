import SwiftUI

// Extension to define standard font styles used throughout the app, based on the UI Style Guide.
extension Font {
    
    /// Font style for main titles (e.g., "Pantry"). SF Pro, Bold, size 22.
    static var appTitle: Font {
        .system(size: 22, weight: .bold)
    }
    
    /// Font style for prominent names (e.g., Recipe Titles, Ingredient Names). SF Pro, Medium, size 18.
    static var prominentName: Font {
        .system(size: 18, weight: .medium)
    }
    
    /// Font style for standard labels under icons or secondary text. SF Pro, Regular, size 15.
    static var standardLabel: Font {
        .system(size: 15, weight: .regular)
    }
    
    /// Font style for placeholder text (e.g., Search Bars). SF Pro, Light, size 16.
    static var placeholderText: Font {
        .system(size: 16, weight: .light)
    }
    
    /// Font style for smaller detail text (e.g., Prep Time, Tags). SF Pro, Regular, size 14.
    static var detailText: Font {
        .system(size: 14, weight: .regular)
    }
    
    /// Font style for the "Missing Ingredient" capsule label. SF Pro, Medium, size 12.
    static var missingIngredient: Font {
        .system(size: 12, weight: .medium) // Style guide mentions small font, medium weight adds slight emphasis
    }
} 