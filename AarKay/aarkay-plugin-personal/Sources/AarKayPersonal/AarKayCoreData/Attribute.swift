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
    public var minValue: String?
    public var maxValue: String?
    public var regex: String?
    public var fetchOrder: Bool?
    public var isTransient: Bool!
    public var isUnique: Bool!

    public var usesScalarValueType: String? {
        /// <aarkay usesScalarValueType>
        switch property.swiftType {
        case "Int16",
             "Int32",
             "Int64",
             "Float",
             "Double",
             "Bool":
            return "YES"
        default:
            return nil
        }
        /// </aarkay>
    }

    public var cdType: String {
        /// <aarkay cdType>
        switch property.swiftType {
        case "Int16":
            return "Integer 16"
        case "Int32":
            return "Integer 32"
        case "Int64":
            return "Integer 64"
        case "Bool":
            return "Boolean"
        case "NSData":
            return "Binary"
        case "String",
             "Float",
             "Double",
             "Decimal",
             "Date",
             "UUID",
             "URI":
            return property.swiftType
        default:
            return "Transformable"
        }
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case property
        case minValue
        case maxValue
        case regex
        case fetchOrder
        case isTransient
        case isUnique
        case usesScalarValueType
        case cdType
    }

    public init(property: ArgModel) {
        self.property = property
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.property = try container.decode(ArgModel.self, forKey: .property)
        self.minValue = try container.decodeIfPresent(String.self, forKey: .minValue)
        self.maxValue = try container.decodeIfPresent(String.self, forKey: .maxValue)
        self.regex = try container.decodeIfPresent(String.self, forKey: .regex)
        self.fetchOrder = try container.decodeIfPresent(Bool.self, forKey: .fetchOrder)
        self.isTransient = try container.decodeIfPresent(Bool.self, forKey: .isTransient) ?? false 
        self.isUnique = try container.decodeIfPresent(Bool.self, forKey: .isUnique) ?? false 
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(property, forKey: .property)
        try container.encodeIfPresent(minValue, forKey: .minValue)
        try container.encodeIfPresent(maxValue, forKey: .maxValue)
        try container.encodeIfPresent(regex, forKey: .regex)
        try container.encodeIfPresent(fetchOrder, forKey: .fetchOrder)
        try container.encode(isTransient, forKey: .isTransient)
        try container.encode(isUnique, forKey: .isUnique)
        try container.encodeIfPresent(usesScalarValueType, forKey: .usesScalarValueType)
        try container.encode(cdType, forKey: .cdType)
    }

}
