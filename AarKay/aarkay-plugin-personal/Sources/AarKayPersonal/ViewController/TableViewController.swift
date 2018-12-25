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

public class TableViewController: ViewController {

    private var model: TableViewControllerModel

    public required init?(generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.model = try contents.decode(type: TableViewControllerModel.self)
        try super.init(generatedfile: generatedfile)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

}

public class TableViewControllerModel: ViewControllerModel {
    public var isStatic: Bool!

    private enum CodingKeys: String, CodingKey {
        case isStatic
    }

    override public init(name: String) {
        super.init(name: name)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isStatic = try container.decodeIfPresent(Bool.self, forKey: .isStatic) ?? false 
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(isStatic, forKey: .isStatic)
        try super.encode(to: encoder)
    }

}
