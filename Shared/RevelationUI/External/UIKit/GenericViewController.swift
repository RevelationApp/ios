//
//  GenericViewController.swift
//  RevelationUI
//
//  Created by RahulKatariya on 30/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

public class GenericViewController<View: UIView>: ViewController {
    public let rootView: View

    public init(view: View) {
        self.rootView = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = self.rootView
    }
    
}
