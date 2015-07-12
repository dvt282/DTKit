//
//  HomeVC.swift
//  UsingProtocolDelegate
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, DetailVCDelegate {


  @IBOutlet weak var inputHomeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    var detailVC = storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as? DetailVC
    detailVC?.delegate = self
    detailVC?.textInput = inputHomeTextField.text
    self.presentViewController(detailVC!, animated: true, completion: nil)
  }
  func popWithText(text: String) {
    self.inputHomeTextField.text = text
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
