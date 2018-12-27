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

public class CoreData: NSObject, Templatable {

    private var model: CoreDataModel
    public var generatedfile: Generatedfile

    public required init?(generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.model = try contents.decode(type: CoreDataModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }

}

public class CoreDataModel: Codable {
    public var name: String
    public var prefix: String!
    public var entities: [EntityModel]

    private enum CodingKeys: String, CodingKey {
        case name
        case prefix
        case entities
    }

    public init(name: String, entities: [EntityModel]) {
        self.name = name
        self.entities = entities
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.prefix = try container.decodeIfPresent(String.self, forKey: .prefix) ?? "CD" 
        self.entities = try container.decode([EntityModel].self, forKey: .entities)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(prefix, forKey: .prefix)
        try container.encode(entities, forKey: .entities)
    }

}

/// AarKayEnd: -
extension CoreData {
    
    public func generatedfiles() -> [Generatedfile] {
        var generatedFiles: [Generatedfile] = []
        
        model.entities.forEach {
            var sourceFile = rk_generatedfile()
            sourceFile.directory = "Shared/RevelationCoreData/Sources/Models"
            sourceFile.name = $0.name
            generatedFiles.append(sourceFile)
        }
        
        return generatedFiles
    }
    
}
