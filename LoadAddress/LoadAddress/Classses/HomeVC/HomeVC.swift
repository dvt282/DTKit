//
//  HomeVC.swift
//  LoadAddress
//
//  Created by ThanhDV on 7/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func handleAction() {
        let os = NSProcessInfo().operatingSystemVersion
        switch (os.majorVersion, os.minorVersion, os.patchVersion) {
        case (8, _, _):
            print("iOS >= 8.0.0")
        case (7, 0, _):
            print("iOS >= 7.0.0, < 7.1.0")
        case (7, _, _):
            print("iOS >= 7.1.0, < 8.0.0")
        default:
            print("iOS < 7.0.0")
        }
        /*
        switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
        case .OrderedSame, .OrderedDescending:
        println("iOS >= 8.0")
        case .OrderedAscending:
        println("iOS < 8.0")
        }
        */
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
