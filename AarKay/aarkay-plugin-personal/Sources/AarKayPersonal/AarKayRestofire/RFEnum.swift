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

public class RFEnum: NSObject, Templatable {

    private var model: RFEnumModel
    public var generatedfile: Generatedfile

    public required init?(generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.model = try contents.decode(type: RFEnumModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }

}

public class RFEnumModel: Codable {
    public var name: String
    public var type: String
    public var props: [ArgModel]

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case props
    }

    public init(name: String, type: String, props: [ArgModel]) {
        self.name = name
        self.type = type
        self.props = props
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.props = try container.decode([ArgModel].self, forKey: .props)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(props, forKey: .props)
    }

}

/// AarKayEnd: -
extension RFEnum {

    public func rk_directory() -> String? {
        return "Shared/RevelationAPI/Sources/ResponseModels"
    }

}
