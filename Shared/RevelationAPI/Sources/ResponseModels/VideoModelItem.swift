import Foundation

public struct VideoModelItem: Codable {
    public let id: String
    public let iso31661: String
    public let iso6391: String
    public let key: String
    public let name: String
    public let site: String
    public let size: Int
    public let type: String

    public init(id: String, iso31661: String, iso6391: String, key: String, name: String, site: String, size: Int, type: String) {
        self.id = id
        self.iso31661 = iso31661
        self.iso6391 = iso6391
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
    }
}
