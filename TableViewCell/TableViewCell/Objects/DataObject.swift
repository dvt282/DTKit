//
//  DataObject.swift
//  TableViewCell
//
//  Created by ThanhDV on 6/18/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class DataObject: NSObject {

        let imageName : String
        let heading : String
        let subTitle : String
        init(imgName: String, heading: String, subTitle: String){
            self.imageName = imgName
            self.heading = heading
            self.subTitle = subTitle
        }

    }
