//
//  Common.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class Common: NSObject {
  
 class var sharedUser: User {
    struct Static {
      static let instance: User = User()
    }
    return Static.instance
  }
}
