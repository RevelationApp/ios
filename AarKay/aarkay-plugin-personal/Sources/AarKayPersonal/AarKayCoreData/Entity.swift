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

public class EntityModel: Codable {
    public var name: String
    public var isAbstract: Bool!
    public var attributes: [AttributeModel]!
    public var relationships: [RelationshipModel]!

    private enum CodingKeys: String, CodingKey {
        case name
        case isAbstract
        case attributes
        case relationships
    }

    public init(name: String) {
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.isAbstract = try container.decodeIfPresent(Bool.self, forKey: .isAbstract) ?? false 
        self.attributes = try container.decodeIfPresent([AttributeModel].self, forKey: .attributes) ?? [] 
        self.relationships = try container.decodeIfPresent([RelationshipModel].self, forKey: .relationships) ?? [] 
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(isAbstract, forKey: .isAbstract)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(relationships, forKey: .relationships)
    }

}
