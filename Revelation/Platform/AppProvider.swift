//
//  AppProvider.swift
//  Revelation
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Foundation
import RevelationDomain
import RevelationCoreData

class AppProvider: AppService {
    
    var movieService: MovieService { return CoreDataProvider().movieService }
    var tvService: TvService { return CoreDataProvider().tvService }
    
}

/// AarKayEnd: -
import RevelationAPI
import Firebase

extension AppProvider {
    
    func setup(completion: @escaping () -> ()) {
        let resource = Bundle.main.infoDictionary!["FirebaseServiceInfoPlist"] as! String
        let filePath = Bundle.main.path(forResource: resource, ofType: "plist")!
        let options = FirebaseOptions(contentsOfFile: filePath)!
        FirebaseApp.configure(options: options)
        
        RevelationAPI.setup(
            host: "api.themoviedb.org/3",
            apiKey: "c3d8a803a729d2f0e663816589397586",
            language: "en-US"
        )
        
        CoreDataProvider().setup(completion: completion)
    }
    
}
