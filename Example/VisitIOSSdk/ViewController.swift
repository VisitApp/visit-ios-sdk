//
//  ViewController.swift
//  VisitIOSSdk
//
//  Created by 2319795 on 06/21/2021.
//  Copyright (c) 2021 2319795. All rights reserved.
//

import UIKit
import VisitIOSSdk

class ViewController: UIViewController, VisitVideoCallDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let visitAppView = VisitAppView.init()
        visitAppView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(visitAppView)
        visitAppView.videoCallDelegate = self
        visitAppView.load(appUrl: "https://web.getvisitapp.xyz")
        let views = ["view" : visitAppView]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[view]-|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

