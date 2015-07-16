//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by ThanhDV on 7/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var textField: UITextField!
    var shareButton: UIButton!
    var activityViewController: UIActivityViewController!
    func createTextField() {
        textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 35))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = "Enter text here..."
        textField.delegate = self
        self.view.addSubview(textField)
    }
    func createButton() {
        shareButton = UIButton(type: UIButtonType.System)
        shareButton.frame = CGRect(x: 20, y: 80, width: 280, height: 44)
        shareButton.setTitle("Share", forState: UIControlState.Normal)
        
        shareButton.addTarget(self, action: "handleShare:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(shareButton)
    }
    func handleShare(sender: UIButton) {
        if textField.text!.isEmpty {
            let message = "Please enter a text and then press Share"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            return
        }
        activityViewController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
       
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

