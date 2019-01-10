import Foundation

public struct FailureResponseModel: Codable {
    public let statusCode: Int
    public let statusMessage: String

    public init(statusCode: Int, statusMessage: String) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
}
