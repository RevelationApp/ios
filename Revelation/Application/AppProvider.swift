//
//  AppProvider.swift
//  Revelation
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation
import RevelationCoreData
import RevelationDomain

class AppProvider: ServiceProvider {
    var movieService: MovieService { return CoreDataProvider().movieService }
}

/// AarKayEnd: -
//import Firebase
import RevelationAPI

extension AppProvider: BootstrapService {
    func bootstrap() {
        /*
        let resource = Bundle.main.infoDictionary!["FirebaseServiceInfoPlist"] as! String
        let filePath = Bundle.main.path(forResource: resource, ofType: "plist")!
        let options = FirebaseOptions(contentsOfFile: filePath)!
        FirebaseApp.configure(options: options)
         */
        RevelationAPI.setup(
            host: "api.themoviedb.org/3",
            apiKey: "c3d8a803a729d2f0e663816589397586",
            language: "en-US"
        )

        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()
        CoreDataProvider().setup { dispatchGroup.leave() }
        dispatchGroup.wait()
    }
}
