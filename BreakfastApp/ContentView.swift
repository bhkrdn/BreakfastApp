//
//  ContentView.swift
//  BreakfastApp
//
//  Created by Baha Kardan on 29.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    // Access the shared ViewModels from the environment
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var pantryViewModel: PantryViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // State to track the selected tab
    @State private var selectedTab: Tab = .breakfastIdeas // Default to center tab
    
    // Enum to represent the tabs for type safety
    enum Tab {
        case pantry
        case breakfastIdeas
        case favorites
    }
    
    init() {
        // Customize TabView appearance (runs once)
        // Set background color - Note: Standard TabView background styling is limited
        // For full white bg, might need custom implementation or UIKit appearance proxy
        UITabBar.appearance().backgroundColor = UIColor(Color.theme.navBackground)
        // Remove the default top line/shadow if desired
        UITabBar.appearance().standardAppearance.shadowColor = .clear
        UITabBar.appearance().standardAppearance.shadowImage = UIImage()
        UITabBar.appearance().standardAppearance.backgroundColor = UIColor(Color.theme.navBackground)
        UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Pantry Tab - Integrate PantryView
            PantryView()
                .tag(Tab.pantry)
                .tabItem {
                    Label("Pantry", systemImage: "basket") // Using SF Symbol
                }
            
            // Breakfast Ideas (Home) Tab
            HomeView(recipeViewModel: recipeViewModel, pantryViewModel: pantryViewModel)
                .tag(Tab.breakfastIdeas)
                .tabItem {
                    Label("Breakfast Ideas", systemImage: "frying.pan") // Using SF Symbol
                }
            
            // Favorites Tab - Integrate FavoritesView
            FavoritesView(recipeViewModel: recipeViewModel, favoritesViewModel: favoritesViewModel)
                .tag(Tab.favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart") // Using SF Symbol
                }
        }
        // Apply the accent color for selected items
        .accentColor(Color.theme.accent) 
        // Ensure text color uses primary (may need adjustments based on iOS version/behavior)
        .onAppear {
             UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.textPrimary)
        }

    }
}

#Preview {
    ContentView()
        // Add environment objects for preview to work
        .environmentObject(RecipeViewModel())
        .environmentObject(PantryViewModel())
        .environmentObject(FavoritesViewModel())
}
