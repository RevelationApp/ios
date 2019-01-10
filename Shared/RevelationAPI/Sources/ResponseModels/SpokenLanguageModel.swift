import Foundation

public struct SpokenLanguageModel: Codable {
    public let iso6391: String
    public let name: String

    public init(iso6391: String, name: String) {
        self.iso6391 = iso6391
        self.name = name
    }
}
