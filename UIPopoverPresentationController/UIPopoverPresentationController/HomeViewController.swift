//
//  HomeViewController.swift
//  UIPopoverPresentationController
//
//  Created by ThanhDV on 10/26/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func popOverAction(sender: UIButton) {
        let popOver = PopOverViewController(nibName: "PopOverViewController", bundle: nil)
        popOver.modalPresentationStyle = UIModalPresentationStyle.Popover
        let pop = popOver.popoverPresentationController
//        popOver.preferredContentSize = CGSizeMake(100,200)
        pop!.delegate = self
        pop!.sourceView = self.view
        pop!.sourceRect = CGRect(x: sender.frame.origin.x + sender.frame.size.width / 2, y:sender.frame.origin.y + sender.frame.size.height, width: 0, height: 0)
         self.presentViewController(popOver, animated: true, completion: nil)
        
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
       return UIModalPresentationStyle.None
    }
}
