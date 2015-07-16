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
    let alertLoad = UIAlertController(title: nil, message: "Loading", preferredStyle: UIAlertControllerStyle.Alert)
    var url: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        if url.isEmpty {
            let request = NSURLRequest(URL: NSURL(string: url)!)
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
        presentViewController(alertLoad, animated: true, completion: nil)
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        alertLoad.dismissViewControllerAnimated(true, completion: nil)
    }
}
