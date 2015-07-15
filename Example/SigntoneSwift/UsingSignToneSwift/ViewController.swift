//
//  ViewController.swift
//  UsingSignToneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  override func viewWillAppear(animated: Bool) {
//    print(Common.sharedUser.username+"\n"+Common.sharedUser.password)
//    print(User.sharedUser.username+"\n"+User.sharedUser.password)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  @IBAction func LoginHandler(sender: UIButton) {
//    Common.sharedUser.login("Thanh", pass: "thanh")
    User.sharedUser.login("thanh", pass: "****")
    
    let logOutVC = storyboard?.instantiateViewControllerWithIdentifier("LogoutVC") as? LogoutVC
    
    self.navigationController?.pushViewController(logOutVC!, animated: true)
    
  }


}

