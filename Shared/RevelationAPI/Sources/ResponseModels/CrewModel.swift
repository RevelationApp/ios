import Foundation

public struct CrewModel: Codable {
    public let creditId: String
    public let department: String
    public let gender: Int
    public let id: Int
    public let name: String
    public let job: String
    public let profilePath: String?

    public init(creditId: String, department: String, gender: Int, id: Int, name: String, job: String, profilePath: String?) {
        self.creditId = creditId
        self.department = department
        self.gender = gender
        self.id = id
        self.name = name
        self.job = job
        self.profilePath = profilePath
    }
}
