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

public class Configurable: NSObject, Templatable {
    private let datafile: Datafile
    private var model: ConfigurableModel
    public var generatedfile: Generatedfile

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: ConfigurableModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }
}

public class ConfigurableModel: Codable {
    public var rfConfigurablePrefix: String?
    public var protocols: String?
    public var name: String
    public var host: String?
    public var path: String?

    private enum CodingKeys: String, CodingKey {
        case rfConfigurablePrefix
        case protocols
        case name
        case host
        case path
    }

    public init(name: String) {
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rfConfigurablePrefix = try container.decodeIfPresent(String.self, forKey: .rfConfigurablePrefix)
        self.protocols = try container.decodeIfPresent(String.self, forKey: .protocols)
        self.name = try container.decode(String.self, forKey: .name)
        self.host = try container.decodeIfPresent(String.self, forKey: .host)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(rfConfigurablePrefix, forKey: .rfConfigurablePrefix)
        try container.encodeIfPresent(protocols, forKey: .protocols)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(host, forKey: .host)
        try container.encodeIfPresent(path, forKey: .path)
    }
}

/// AarKayEnd: -
extension Configurable {

    public func rk_filename() -> String {
        return model.name + "Configurable"
    }

}
