//
//  LoadWebVC.swift
//  LoadAddress
//
//  Created by ThanhDV on 7/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class LoadWebVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!
  var url: String!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.hidesBackButton = true
    
    let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: "closeHandle:")

    self.navigationItem.rightBarButtonItem = closeButton
      print("URL: \(url)")
      if !url.isEmpty {
        let request = NSURLRequest(URL: NSURL(string: url)!)
        self.webView.loadRequest(request)
      }
      
    }
  func closeHandle(sender: UIBarButtonItem) {
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension LoadWebVC: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}
