//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//

import AarKayKit
import AarKayPlugin
import Foundation

public class RequestableTestModel: Codable {
    public var testPathParams: [String]?
    public var testInitParams: String?
    public var testQueryModel: String?
    public var testRequestModel: String?
    public var testResponseModel: String?

    private enum CodingKeys: String, CodingKey {
        case testPathParams
        case testInitParams
        case testQueryModel
        case testRequestModel
        case testResponseModel
    }

    public init() {
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.testPathParams = try container.decodeIfPresent([String].self, forKey: .testPathParams)
        self.testInitParams = try container.decodeIfPresent(String.self, forKey: .testInitParams)
        self.testQueryModel = try container.decodeIfPresent(String.self, forKey: .testQueryModel)
        self.testRequestModel = try container.decodeIfPresent(String.self, forKey: .testRequestModel)
        self.testResponseModel = try container.decodeIfPresent(String.self, forKey: .testResponseModel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(testPathParams, forKey: .testPathParams)
        try container.encodeIfPresent(testInitParams, forKey: .testInitParams)
        try container.encodeIfPresent(testQueryModel, forKey: .testQueryModel)
        try container.encodeIfPresent(testRequestModel, forKey: .testRequestModel)
        try container.encodeIfPresent(testResponseModel, forKey: .testResponseModel)
    }
}
