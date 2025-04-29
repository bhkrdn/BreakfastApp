import Foundation

struct Recipe: Identifiable, Decodable {
    var id: UUID
    let name: String
    let ingredients: [String]
    let prepTime: Int
    let tags: [String]
    let imageName: String? // Optional, as it might not be in the JSON initially

    // Define coding keys to map JSON fields to struct properties if necessary
    // If JSON keys match struct property names exactly, this enum isn't strictly needed
    // but is good practice for clarity.
    enum CodingKeys: String, CodingKey {
        case name
        case ingredients
        case prepTime
        case tags
        case imageName // We might add this to JSON later or derive it
    }

    // Custom initializer to generate a UUID during decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Generate a new UUID for each recipe instance
        self.id = UUID()
        
        // Decode other properties
        self.name = try container.decode(String.self, forKey: .name)
        self.ingredients = try container.decode([String].self, forKey: .ingredients)
        self.prepTime = try container.decode(Int.self, forKey: .prepTime)
        self.tags = try container.decode([String].self, forKey: .tags)
        
        // Decode imageName if present, otherwise nil
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
    }
    
    // Add a memberwise initializer for testing or manual creation if needed
    init(id: UUID = UUID(), name: String, ingredients: [String], prepTime: Int, tags: [String], imageName: String? = nil) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.prepTime = prepTime
        self.tags = tags
        self.imageName = imageName
    }
} 