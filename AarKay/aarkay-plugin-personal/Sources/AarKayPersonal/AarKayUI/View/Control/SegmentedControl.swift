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

public class SegmentedControl: View {

    private let datafile: Datafile
    private var model: SegmentedControlModel

    public required init?(datafile: Datafile, generatedfile: Generatedfile) throws {
        guard let contents = generatedfile.contents else { return nil }
        self.datafile = datafile
        self.model = try contents.decode(type: SegmentedControlModel.self)
        try super.init(datafile: datafile, generatedfile: generatedfile)
        var generatedfile = generatedfile
        generatedfile.contents = try Dictionary.encode(data: model)
        self.generatedfile = generatedfile
    }

}

public class SegmentedControlModel: ViewModel {}
