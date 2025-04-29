//
//  BreakfastAppTests.swift
//  BreakfastAppTests
//
//  Created by Baha Kardan on 29.04.2025.
//

import Testing
import Foundation
@testable import BreakfastApp

struct BreakfastAppTests {

    // MARK: - Data Loading Tests

    @Test func loadRecipesFromJSON() async throws {
        // Test if the DataLoadingService can load and decode the JSON file.
        let recipes = DataLoadingService.loadRecipes()
        
        // Basic check: Should not be empty if recipes.json exists and is valid
        #expect(!recipes.isEmpty, "Recipes array should not be empty after loading.")
        
        // Check a specific known recipe (optional, adjust based on your JSON)
        // Example: Find a recipe named "Classic scrambled eggs"
        let classicScrambled = recipes.first { $0.name == "Classic scrambled eggs" }
        #expect(classicScrambled != nil, "Should find 'Classic scrambled eggs'.")
        
        // Use optional chaining and provide default values for unwrapping
        #expect((classicScrambled?.ingredients.count ?? 0) == 4, "'Classic scrambled eggs' should have 4 ingredients.")
        #expect((classicScrambled?.prepTime ?? -1) == 5, "'Classic scrambled eggs' should have prep time 5.")
        #expect(classicScrambled?.tags.contains("High Protein") ?? false, "'Classic scrambled eggs' should have 'High Protein' tag.")
    }

    // MARK: - RecipeViewModel Tests
    
    @Test func recipeViewModelInitialization() {
        // Test if the RecipeViewModel initializes and loads recipes.
        let viewModel = RecipeViewModel()
        
        // Check if the published recipes array is populated after init.
        #expect(!viewModel.recipes.isEmpty, "RecipeViewModel should load recipes on initialization.")
        
        // Optional: Check if the count matches what DataLoadingService loads (can be fragile)
        // let expectedCount = DataLoadingService.loadRecipes().count 
        // #expect(viewModel.recipes.count == expectedCount, "ViewModel recipe count should match direct load count.")
    }
    
    @Test func recipeViewModelFindRecipeByID() throws {
        let viewModel = RecipeViewModel()
        
        // Use #require to fail fast if no recipes are loaded
        let firstRecipe = try #require(viewModel.recipes.first, "ViewModel should have recipes loaded.")
        
        let foundRecipe = viewModel.recipe(withId: firstRecipe.id)
        #expect(foundRecipe != nil, "Should be able to find a recipe by its ID.")
        #expect(foundRecipe?.id == firstRecipe.id, "Found recipe should have the correct ID.")
        #expect(foundRecipe?.name == firstRecipe.name, "Found recipe should have the correct name.")
        
        let nonExistentID = UUID()
        let notFoundRecipe = viewModel.recipe(withId: nonExistentID)
        #expect(notFoundRecipe == nil, "Should return nil for a non-existent recipe ID.")
    }

    // Add more tests later for PantryViewModel and FavoritesViewModel

}
