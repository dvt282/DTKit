//
//  HomeVC.swift
//  LoadAddress
//
//  Created by ThanhDV on 7/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func greteIOS9() -> Bool {
        let os = NSProcessInfo().operatingSystemVersion
        switch (os.majorVersion, os.minorVersion, os.patchVersion) {
        case (8, _, _):
            print("iOS >= 8.0.0")
            return true
         default:
            return false
       }
    }

    @IBAction func goAction(sender: UIButton) {
        if !urlTextField.text!.isEmpty {
           let urlString = urlTextField.text
            if greteIOS9() {
                UIApplication.sharedApplication().openURL(NSURL(string: urlString!)!)
            }else {
                let webVC = LoadWebVC(nibName: "LoadWebVC", bundle: nil)
                webVC.url = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
extension HomeVC: UITextFieldDelegate {
    
}
