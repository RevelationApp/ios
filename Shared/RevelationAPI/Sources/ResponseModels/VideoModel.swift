import Foundation

public struct VideoModel: Codable {
    public let id: Int
    public let results: [VideoModelItem]

    public init(id: Int, results: [VideoModelItem]) {
        self.id = id
        self.results = results
    }
}
