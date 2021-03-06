import Foundation

public struct NetworkModel: Codable {
    public let originCountry: String
    public let id: Int
    public let name: String
    public let logoPath: String?

    public init(originCountry: String, id: Int, name: String, logoPath: String?) {
        self.originCountry = originCountry
        self.id = id
        self.name = name
        self.logoPath = logoPath
    }
}
