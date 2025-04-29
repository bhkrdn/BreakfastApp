import Foundation

enum LoadingError: Error {
    case fileNotFound(String)
    case dataLoadingFailed(String, Error)
    case decodingFailed(String, Error)
}

struct DataLoadingService {
    
    static func load<T: Decodable>(_ filename: String) throws -> T {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            print("Error: Couldn't find \(filename) in main bundle.")
            throw LoadingError.fileNotFound(filename)
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            print("Error: Couldn't load data from \(filename): \(error)")
            throw LoadingError.dataLoadingFailed(filename, error)
        }
        
        do {
            let decoder = JSONDecoder()
            // Configure decoder if needed (e.g., date strategies)
            let loadedData = try decoder.decode(T.self, from: data)
            return loadedData
        } catch {
            print("Error: Couldn't decode \(filename) as \(T.self):\n\(error)")
            throw LoadingError.decodingFailed(filename, error)
        }
    }
    
    // Convenience function specifically for loading recipes
    static func loadRecipes() -> [Recipe] {
        do {
            let recipes: [Recipe] = try load("recipes.json")
            return recipes
        } catch {
            // Handle error appropriately - for MVP, maybe return empty or fatalError
            print("Failed to load recipes: \(error)")
            // Depending on app requirements, might want to return [] or trigger error state
            return [] 
        }
    }
} 