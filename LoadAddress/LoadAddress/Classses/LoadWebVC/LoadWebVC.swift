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
  @IBOutlet var activityIndicator: UIActivityIndicatorView!
  
  var url: String!
  override func viewDidLoad() {
    super.viewDidLoad()
    configView()
    handleLoadWeb()
    
    }
  func configView() {
    self.navigationItem.hidesBackButton = true
    self.navigationController?.navigationBarHidden = true
   
  }
  func handleLoadWeb() {
    print("URL: \(url)")
    if !url.isEmpty {
      let request = NSURLRequest(URL: NSURL(string: url)!)
      activityIndicator.hidesWhenStopped = true
      activityIndicator.startAnimating()
      self.webView.loadRequest(request)
    }
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
      activityIndicator.stopAnimating()
    }
  @IBAction func doRefresh(AnyObject) {
    webView.reload()
  }
  
  @IBAction func goBack(AnyObject) {
    webView.goBack()
  }
  
  @IBAction func goForward(AnyObject) {
    webView.goForward()
  }
  
  @IBAction func stop(AnyObject) {
    webView.stopLoading()
    self.dismissViewControllerAnimated(true, completion: nil)
  }

}
