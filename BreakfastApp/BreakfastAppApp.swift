//
//  BreakfastAppApp.swift
//  BreakfastApp
//
//  Created by Baha Kardan on 29.04.2025.
//

import SwiftUI

@main
struct BreakfastAppApp: App {
    // Create a single instance of RecipeViewModel that persists for the app's lifecycle
    @StateObject private var recipeViewModel = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Inject the RecipeViewModel into the environment
                .environmentObject(recipeViewModel)
        }
    }
}
