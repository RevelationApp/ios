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

public class ImageView: View {
    private let datafile: Datafile
    private var model: ImageViewModel

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: ImageViewModel.self)
        try super.init(datafile: datafile, generatedfile: generatedfile)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }
}

public class ImageViewModel: ViewModel {}