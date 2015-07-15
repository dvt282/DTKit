//
//  CellCustom.swift
//  TableViewCell
//
//  Created by ThanhDV on 6/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class CellCustom: UITableViewCell {

    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblSubtile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func initWithData(data: NSMutableArray, indexPath: NSIndexPath){
        let entry = data[indexPath.row] as! DataObject
        self.lblHeading.text = entry.heading
        self.lblSubtile.text = entry.subTitle
        self.imageContent.image = UIImage(named: entry.imageName)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
