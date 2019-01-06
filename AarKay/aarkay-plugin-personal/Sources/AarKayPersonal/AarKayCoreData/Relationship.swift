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

public class RelationshipModel: Codable {
    public var property: ArgModel

    public var strippedType: String {
        /// <aarkay strippedType>
        if toMany {
            return String(property.swiftType.dropLast().dropFirst())
        } else {
            return property.swiftType
        }
        /// </aarkay>
    }

    public var toMany: Bool {
        /// <aarkay toMany>
        return property.swiftType.hasPrefix("[")
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case property
        case strippedType
        case toMany
    }

    public init(property: ArgModel) {
        self.property = property
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.property = try container.decode(ArgModel.self, forKey: .property)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(property, forKey: .property)
        try container.encode(strippedType, forKey: .strippedType)
        try container.encode(toMany, forKey: .toMany)
    }

}
