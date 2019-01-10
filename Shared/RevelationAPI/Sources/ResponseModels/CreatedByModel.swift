import Foundation

public struct CreatedByModel: Codable {
    public let creditId: String
    public let gender: Int
    public let id: Int
    public let name: String
    public let profilePath: String?

    public init(creditId: String, gender: Int, id: Int, name: String, profilePath: String?) {
        self.creditId = creditId
        self.gender = gender
        self.id = id
        self.name = name
        self.profilePath = profilePath
    }
}
