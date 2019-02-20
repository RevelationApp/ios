//
//  ViewController.swift
//  RevelationUI
//
//  Created by RahulKatariya on 30/12/18.
//  Copyright © 2018 RahulKatariya. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    // Lifecycle
    public var onViewDidLoad: (() -> Void)?
    public var onDataLoad: (() -> Void)?
    public var onViewWillLayoutSubviews: (() -> Void)?
    public var onViewDidLayoutSubviews: (() -> Void)?
    public var onViewWillAppear: ((Bool) -> Void)?
    public var onViewDidAppear: ((Bool) -> Void)?
    public var onViewWillDisappear: ((Bool) -> Void)?
    public var onViewDidDisappear: ((Bool) -> Void)?

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.onViewDidLoad?()
        self.onDataLoad?()
    }

    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.onViewWillLayoutSubviews?()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.onViewDidLayoutSubviews?()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.onViewWillAppear?(animated)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.onViewDidAppear?(animated)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.onViewWillDisappear?(animated)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.onViewDidDisappear?(animated)
    }
}
