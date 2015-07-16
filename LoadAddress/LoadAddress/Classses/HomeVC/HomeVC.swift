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
    func isGreaterIOS9() -> Bool {
      let device = UIDevice.currentDevice()
      let iosVerson = (device.systemVersion as NSString).floatValue
      if iosVerson >= 9.0 {
      return true
      }
      return false
  }

    @IBAction func goAction(sender: UIButton!) {
        if !urlTextField.text!.isEmpty {
           var urlString = urlTextField.text
          let rangeHTTP = urlString!.rangeOfString("http://")
          if let _ = rangeHTTP {
            
          }else {
            urlString = "http://"+urlString!
          }
            if isGreaterIOS9() {
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
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

    return true
  }
  func textFieldDidBeginEditing(textField: UITextField) {
    textField.returnKeyType = UIReturnKeyType.Go
  }
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    self.goAction(nil)
    return true
  }
}
