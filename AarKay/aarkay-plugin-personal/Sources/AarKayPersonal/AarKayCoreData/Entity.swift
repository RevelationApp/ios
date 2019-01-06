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
    public var domainModel: String?
    public var parentEntity: String?
    public var attributes: [AttributeModel]!
    public var relationships: [RelationshipModel]!
    public var children: [EntityModel]!

    public var isAbstract: Bool {
        /// <aarkay isAbstract>
        return children.count > 0
        /// </aarkay>
    }

    public var constraints: [AttributeModel]? {
        /// <aarkay constraints>
        let constraints = attributes.filter { $0.isUnique }
        return constraints.isEmpty ? nil : constraints
        /// </aarkay>
    }

    public var indexes: [AttributeModel]? {
        /// <aarkay indexes>
        return attributes.filter { $0.fetchOrder != nil }
        /// </aarkay>
    }

    public var singleRelationships: [RelationshipModel] {
        /// <aarkay singleRelationships>
        return relationships.filter { !$0.property.type.hasPrefix("[") }
        /// </aarkay>
    }

    public var collectionRelationships: [RelationshipModel] {
        /// <aarkay collectionRelationships>
        return relationships.filter { $0.property.type.hasPrefix("[") }
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case domainModel
        case parentEntity
        case attributes
        case relationships
        case children
        case isAbstract
        case constraints
        case indexes
        case singleRelationships
        case collectionRelationships
    }

    public init(name: String) {
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.domainModel = try container.decodeIfPresent(String.self, forKey: .domainModel)
        self.parentEntity = try container.decodeIfPresent(String.self, forKey: .parentEntity)
        self.attributes = try container.decodeIfPresent([AttributeModel].self, forKey: .attributes) ?? [] 
        self.relationships = try container.decodeIfPresent([RelationshipModel].self, forKey: .relationships) ?? [] 
        self.children = try container.decodeIfPresent([EntityModel].self, forKey: .children) ?? [] 
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(domainModel, forKey: .domainModel)
        try container.encodeIfPresent(parentEntity, forKey: .parentEntity)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(relationships, forKey: .relationships)
        try container.encode(children, forKey: .children)
        try container.encode(isAbstract, forKey: .isAbstract)
        try container.encodeIfPresent(constraints, forKey: .constraints)
        try container.encodeIfPresent(indexes, forKey: .indexes)
        try container.encode(singleRelationships, forKey: .singleRelationships)
        try container.encode(collectionRelationships, forKey: .collectionRelationships)
    }

}
