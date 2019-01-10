import Foundation

public struct ProductionCompanyModel: Codable {
    public let id: Int
    public let name: String
    public let logoPath: String?
    public let originCountry: String

    public init(id: Int, name: String, logoPath: String?, originCountry: String) {
        self.id = id
        self.name = name
        self.logoPath = logoPath
        self.originCountry = originCountry
    }
}
