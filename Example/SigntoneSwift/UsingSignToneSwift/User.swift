//
//  User.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class User: NSObject {
  var username: String
  var password: String
  var dataUser: [String]
  
  override init (){
    username = ""
    password = ""
    dataUser = []
  }
  
  
  func login(name: String, pass: String) {
    self.username = name
    self.password = pass
    
    dataUser.append(self.username)
  }
  func logout(){
    self.username = ""
    self.password = ""
  }
  
//  class var shareUser: User {
//    struct Static {
//      static let instance: User = User()
//    }
//    return Static.instance
//  }
  class var sharedUser: User {
    struct Static {
      static var onceToken: dispatch_once_t = 0
      static var instance: User? = nil
    }
    dispatch_once(&Static.onceToken, { () -> Void in
      Static.instance = User()
    })
    return Static.instance!
  }
}
