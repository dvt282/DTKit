//
//  ClassItem.swift
//  DemoTableDropDown-Swift
//
//  Created by ThanhDV on 9/3/15.
//  Copyright © 2015 AST. All rights reserved.
//

import UIKit

class ClassItem: NSObject {
    var title: NSString
    var students: NSMutableArray
    var isSelect: Bool
    override init() {
        self.title = ""
        isSelect = false
        self.students = NSMutableArray()
    }
}
