//
//  ViewController.swift
//  MultiLanguage
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var languageText: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.languageText.setupAutolocalizationWithKey("hello", keyPath: "text")
  }

  @IBAction func changeLanguage(sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      dp_set_current_language("en")
    case 1:
      dp_set_current_language("vi")
    default:
      break
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

