//
//  CellText.swift
//  TableViewCell
//
//  Created by ThanhDV on 6/18/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class CellText: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    func initWithData(data: NSMutableArray, indexPath: NSIndexPath){
        let entry = data[indexPath.row] as! DataObject
        self.lblTitle.text = entry.heading
        self.lblSubtitle.text = entry.subTitle
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
