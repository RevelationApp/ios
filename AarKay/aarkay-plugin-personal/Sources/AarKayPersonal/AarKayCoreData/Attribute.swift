//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//

import Foundation
import AarKayKit
import AarKayPlugin

public class AttributeModel: Codable {
    public var property: ArgModel
    public var isTransient: Bool!
    public var isUnique: Bool!

    private enum CodingKeys: String, CodingKey {
        case property
        case isTransient
        case isUnique
    }

    public init(property: ArgModel) {
        self.property = property
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.property = try container.decode(ArgModel.self, forKey: .property)
        self.isTransient = try container.decodeIfPresent(Bool.self, forKey: .isTransient) ?? false 
        self.isUnique = try container.decodeIfPresent(Bool.self, forKey: .isUnique) ?? false 
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(property, forKey: .property)
        try container.encode(isTransient, forKey: .isTransient)
        try container.encode(isUnique, forKey: .isUnique)
    }

}
