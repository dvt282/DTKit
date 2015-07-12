//
//  LogoutVC.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class LogoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//      for user in Common.sharedUser.dataUser {
//        print("\(Common.sharedUser.dataUser.count):"+user+"\n")
//      }
      for user in User.sharedUser.dataUser {
        print("\(User.sharedUser.dataUser.count):"+user+"\n")
      }
//        print(Common.sharedUser.username+"\n"+Common.sharedUser.password)
//      print(User.sharedUser.username+"\n"+User.sharedUser.password)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
  @IBAction func popView(sender: UIButton) {


//    Common.sharedUser.logout()
    User.sharedUser.logout()
    self.navigationController?.popViewControllerAnimated(true)
  }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
