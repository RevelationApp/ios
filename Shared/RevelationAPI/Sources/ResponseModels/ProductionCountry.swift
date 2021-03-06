import Foundation

public struct ProductionCountry: Codable {
    public let iso31661: String
    public let name: String

    public init(iso31661: String, name: String) {
        self.iso31661 = iso31661
        self.name = name
    }
}
