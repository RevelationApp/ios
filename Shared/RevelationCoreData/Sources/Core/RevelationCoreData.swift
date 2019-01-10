//
//  RevelationCoreData.swift
//  RevelationCoreData
//
//  Created by Rahul Katariya on 02/10/17.
//  Copyright © 2017 RahulKatariya. All rights reserved.
//

import CoreData

public class RevelationCoreData {
    public static let stack: CoreDataStack = {
        return CoreDataStack(
            name: "Revelation",
            bundle: Bundle(for: RevelationCoreData.self)
        )
    }()
}
