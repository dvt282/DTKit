//
//  HomeHeaderView.swift
//  DemoTableDropDown-Swift
//
//  Created by ThanhDV on 9/3/15.
//  Copyright © 2015 AST. All rights reserved.
//

import UIKit

protocol HomeHeaderViewDelegate {
    func didSelectedHeaderWith(index: Int)
}

class HomeHeaderView: UIView {

    @IBOutlet weak var btMask: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    var delegate:HomeHeaderViewDelegate?
    
    @IBAction func selectHeader(sender: UIButton) {
        if (delegate != nil) {
            delegate!.didSelectedHeaderWith(btMask.tag)
        }
    }

}

