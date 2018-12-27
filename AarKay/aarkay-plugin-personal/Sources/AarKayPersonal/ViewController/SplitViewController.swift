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

public class SplitViewController: ViewController {

    private var model: SplitViewControllerModel

    public required init?(generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.model = try contents.decode(type: SplitViewControllerModel.self)
        try super.init(generatedfile: generatedfile)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

}

public class SplitViewControllerModel: ViewControllerModel {}