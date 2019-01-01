//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//
//  Generated by AarKay on 27/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Restofire

protocol TvConfigurable: Configurable {}

extension TvConfigurable {
    static var tvConfiguration: Configuration {
        var config = Restofire.Configuration.default
        config.host = config.host + "/tv"
        return config
    }

    public var configuration: Configuration {
        return Self.tvConfiguration
    }
}