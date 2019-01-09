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

public class RIBs: NSObject, Templatable {
    private let datafile: Datafile
    private var model: RIBsModel
    public var generatedfile: Generatedfile

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: RIBsModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }
}

public class RIBsModel: Codable {
    public var root: SceneModel
    public var shared: [SceneModel]?

    private enum CodingKeys: String, CodingKey {
        case root
        case shared
    }

    public init(root: SceneModel) {
        self.root = root
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.root = try container.decode(SceneModel.self, forKey: .root)
        self.shared = try container.decodeIfPresent([SceneModel].self, forKey: .shared)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(root, forKey: .root)
        try container.encodeIfPresent(shared, forKey: .shared)
    }
}

/// MARK:- AarKayEnd
extension RIBs {
    
    public func generatedfiles() -> [Generatedfile] {
        var all = [Generatedfile]()
        var generatedFile = rk_generatedfile()
        generatedFile.directory = "Sources/Scenes/"
        sharedScenes(generatedFile: generatedFile, model: model, all: &all)
        childRIBs(generatedFile: generatedFile, model: model.root, all: &all)
        return all
    }
    
    func sharedScenes(generatedFile: Generatedfile, model: RIBsModel, all: inout [Generatedfile]) {
        model.shared?.forEach {
            try? addRIBScene(scene: $0, generatedFile: generatedFile, all: &all)
        }
    }
    
    func childRIBs(generatedFile: Generatedfile, model: SceneModel, all: inout [Generatedfile]) {
        
        guard model.create else { return }
        
        try? addRIBScene(scene: model, generatedFile: generatedFile, all: &all)
        
        let name = model.name
        guard let children = model.children else { return }
        children.forEach { child in
            if child.deps == nil { child.deps = [] }
            child.deps += model.deps
            var childFile = generatedFile
            childFile.directory = (childFile.directory ?? "") + (name != "" ? "\(name)/" : "")
            childRIBs(generatedFile: childFile, model: child, all: &all)
        }
        
    }
    
    func addRIBScene(scene: SceneModel, generatedFile: Generatedfile, all: inout [Generatedfile]) throws {
        let sceneName = scene.name
        
        var routerFile = generatedFile
        routerFile.template = "RIBRouter"
        routerFile.directory = (routerFile.directory ?? "") + sceneName
        routerFile.name = "\(sceneName)Router"
        routerFile.contents = try Dictionary.encode(data: scene)
        all.append(routerFile)
        
        var interactorFile = generatedFile
        interactorFile.template = "RIBInteractor"
        interactorFile.directory = (interactorFile.directory ?? "") + sceneName
        interactorFile.name = "\(sceneName)Interactor"
        interactorFile.contents = try Dictionary.encode(data: scene)
        all.append(interactorFile)
        
        var builderFile = generatedFile
        builderFile.template = "RIBBuilder"
        builderFile.directory = (builderFile.directory ?? "") + sceneName
        builderFile.name = "\(sceneName)Builder"
        builderFile.contents = try Dictionary.encode(data: scene)
        all.append(builderFile)
        
        if scene.viewable && !scene.isRoot && scene.vcable == nil {
            var vcFile = generatedFile
            vcFile.template = "RIBVC"
            vcFile.directory = (vcFile.directory ?? "") + sceneName
            vcFile.name = "\(sceneName)ViewController"
            vcFile.contents = try Dictionary.encode(data: scene)
            all.append(vcFile)
        }
    }
}
