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

public class SceneModel: Codable {
    public var name: String
    public var routeTypes: [String]?
    public var children: [SceneModel]?
    public var viewable: Bool!
    public var vcable: String?
    public var deps: [ArgModel]!
    public var create: Bool!
    public var sb: Bool!
    public var depsVC: [ArgModel]?
    public var depsIR: [ArgModel]?
    public var vcType: String!
    public var imports: [String]?

    public var isRoot: Bool {
        /// <aarkay isRoot>
        return name == "Root"
        /// </aarkay>
    }

    public var isPresentable: Bool {
        /// <aarkay isPresentable>
        return !isRoot
        /// </aarkay>
    }

    public var allDeps: [ArgModel]? {
        /// <aarkay allDeps>
        var allDeps: [ArgModel] = []
        if let depsIR = depsIR { allDeps += depsIR }
        if let depsVC = depsVC { allDeps += depsVC }
        return allDeps.isEmpty ? nil : allDeps
        /// </aarkay>
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case routeTypes
        case children
        case viewable
        case vcable
        case deps
        case create
        case sb
        case depsVC
        case depsIR
        case vcType
        case imports
        case isRoot
        case isPresentable
        case allDeps
    }

    public init(name: String) {
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.routeTypes = try container.decodeIfPresent([String].self, forKey: .routeTypes)
        self.children = try container.decodeIfPresent([SceneModel].self, forKey: .children)
        self.viewable = try container.decodeIfPresent(Bool.self, forKey: .viewable) ?? true
        self.vcable = try container.decodeIfPresent(String.self, forKey: .vcable)
        self.deps = try container.decodeIfPresent([ArgModel].self, forKey: .deps) ?? []
        self.create = try container.decodeIfPresent(Bool.self, forKey: .create) ?? true
        self.sb = try container.decodeIfPresent(Bool.self, forKey: .sb) ?? true
        self.depsVC = try container.decodeIfPresent([ArgModel].self, forKey: .depsVC)
        self.depsIR = try container.decodeIfPresent([ArgModel].self, forKey: .depsIR)
        self.vcType = try container.decodeIfPresent(String.self, forKey: .vcType) ?? "UIView"
        self.imports = try container.decodeIfPresent([String].self, forKey: .imports)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(routeTypes, forKey: .routeTypes)
        try container.encodeIfPresent(children, forKey: .children)
        try container.encode(viewable, forKey: .viewable)
        try container.encodeIfPresent(vcable, forKey: .vcable)
        try container.encode(deps, forKey: .deps)
        try container.encode(create, forKey: .create)
        try container.encode(sb, forKey: .sb)
        try container.encodeIfPresent(depsVC, forKey: .depsVC)
        try container.encodeIfPresent(depsIR, forKey: .depsIR)
        try container.encode(vcType, forKey: .vcType)
        try container.encodeIfPresent(imports, forKey: .imports)
        try container.encode(isRoot, forKey: .isRoot)
        try container.encode(isPresentable, forKey: .isPresentable)
        try container.encodeIfPresent(allDeps, forKey: .allDeps)
    }
}
