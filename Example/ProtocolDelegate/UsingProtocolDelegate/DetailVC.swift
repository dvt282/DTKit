//
//  DetailVC.swift
//  UsingProtocolDelegate
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

  var delegate: DetailVCDelegate?
  var textInput: String?
  @IBOutlet weak var outputDetailTexfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.outputDetailTexfield.text = textInput!
    }
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    if (delegate != nil) {
      delegate?.popWithText(outputDetailTexfield.text)
      self.dismissViewControllerAnimated(true, completion: nil)
    }
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
protocol DetailVCDelegate {
  func popWithText(text: String);
}