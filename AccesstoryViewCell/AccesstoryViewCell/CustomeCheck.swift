//
//  CustomeCheck.swift
//  AccesstoryViewCell
//
//  Created by Thanh on 7/11/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class CustomeCheck: UIImageView {

  var check: Bool = false
    {
    didSet {
      if check {
        self.image = checkImage
      }else{
        self.image = unCheckImage
      }
    }
  }
  var checkImage: UIImage
  var unCheckImage: UIImage
  
  init(checkImage: UIImage, unCheckImage: UIImage) {
    self.checkImage = checkImage
    self.unCheckImage = unCheckImage
    super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: checkImage.size))
    self.image = unCheckImage
    self.userInteractionEnabled = true
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
