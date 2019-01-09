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

public class Typography: NSObject, Templatable {
    private let datafile: Datafile
    private var model: TypographyModel
    public var generatedfile: Generatedfile

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: TypographyModel.self)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

    public static func resource() -> String {
        return #file
    }
}

public class TypographyModel: Codable {
    public var fontStyles: [ArgModel]
    public var fontSizes: [ArgModel]

    private enum CodingKeys: String, CodingKey {
        case fontStyles
        case fontSizes
    }

    public init(fontStyles: [ArgModel], fontSizes: [ArgModel]) {
        self.fontStyles = fontStyles
        self.fontSizes = fontSizes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fontStyles = try container.decode([ArgModel].self, forKey: .fontStyles)
        self.fontSizes = try container.decode([ArgModel].self, forKey: .fontSizes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fontStyles, forKey: .fontStyles)
        try container.encode(fontSizes, forKey: .fontSizes)
    }
}
