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
    public var version: Int!
    public var entities: [EntityModel]

    public var allEntities: [EntityModel] {
        /// <aarkay allEntities>
        func getChildren(entity: EntityModel) -> [EntityModel] {
            var items: [EntityModel] = []
            entity.children.forEach { child in
                child.parentEntity = entity.name
                items.append(child)
                items.append(contentsOf: getChildren(entity: child))
            }
            return items
        }
        return entities.reduce([], { (result, entity) -> [EntityModel] in
            var items = result
            items.append(entity)
            items.append(contentsOf: getChildren(entity: entity))
            return items
        })
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case version
        case entities
        case allEntities
    }

    public init(name: String, entities: [EntityModel]) {
        self.name = name
        self.entities = entities
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version) ?? 1 
        self.entities = try container.decode([EntityModel].self, forKey: .entities)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(version, forKey: .version)
        try container.encode(entities, forKey: .entities)
        try container.encode(allEntities, forKey: .allEntities)
    }

}

/// AarKayEnd: -
extension CoreData {
    
    public func rk_directory() -> String? {
        return "Shared/RevelationCoreData/Sources/"
    }
    
    public func generatedfiles() -> [Generatedfile] {
        var generatedFiles: [Generatedfile] = []
        
        var currentVersionFile = rk_generatedfile()
        currentVersionFile.name = ".xccurrentversion"
        currentVersionFile.template = "xccurrentversion"
        currentVersionFile.directory = rk_directory()! + "Revelation.xcdatamodeld"
        if model.version == 1 {
            currentVersionFile.contents = ["name" : model.name]
        } else {
            currentVersionFile.contents = ["name" : model.name, "version": model.version]
        }
        generatedFiles.append(currentVersionFile)
        
        let modelContentsDirectory = model.version == 1 ?
            "Revelation.xcdatamodel" : "Revelation_\(model.version!).xcdatamodel"
        var modelContentsFile = rk_generatedfile()
        modelContentsFile.name = "contents"
        modelContentsFile.template = "contents"
        modelContentsFile.directory = rk_directory()! + "Revelation.xcdatamodeld/" + modelContentsDirectory
        generatedFiles.append(modelContentsFile)
        
        model.allEntities.forEach { entity in
            var sourceFile = rk_generatedfile()
            sourceFile.directory = rk_directory()! + "Models"
            sourceFile.template = "Entity"
            sourceFile.name = "CD" + entity.name
            sourceFile.contents = try! Dictionary.encode(data: entity)
            generatedFiles.append(sourceFile)
        }
        
        return generatedFiles
    }
    
}
