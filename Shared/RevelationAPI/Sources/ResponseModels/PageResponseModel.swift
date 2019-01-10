import Foundation

public struct PageResponseModel<T: Codable>: Codable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [T]

    public init(page: Int, totalResults: Int, totalPages: Int, results: [T]) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
}
