//
//  ErrorView.swift
//  RevelationUI
//
//  Created by RahulKatariya on 26/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import Reusable
import UIKit

public class ErrorView: UIView, NibLoadable {
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var retryButton: UIButton!

    public var retryBlock: (() -> Void)!

    @IBAction func retryButtonTapped(_ sender: Any) {
        self.retryBlock()
    }
}
