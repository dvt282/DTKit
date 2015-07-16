//
//  StringReverActivity.swift
//  UIActivityViewController
//
//  Created by ThanhDV on 7/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class StringReverActivity: UIActivity {
    
    var activityItems = [NSString]()
    
    override func activityType() -> String? {
        return NSBundle.mainBundle().bundleIdentifier! + ".StringReverActivity"
    }
    override func activityTitle() -> String? {
       return "Reverse String"
    }
    override func activityImage() -> UIImage? {
        return UIImage(named: "imageShare")
    }
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for object: AnyObject in activityItems {
            if object is String {
                return true
            }
        }
        return false
    }
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for object in activityItems {
            if object is String {
               self.activityItems.append(object as! String)
            }
        }
    }
    func reverseOfString(string: NSString) -> NSString {
        var reslult = ""
        var characters = [Character]()
//        for character in string {
//            characters.append(characters)
//            
//        }
    }
}
