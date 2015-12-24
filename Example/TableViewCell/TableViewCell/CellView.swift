//
//  CellView.swift
//  TableViewCell
//
//  Created by ThanhDV on 6/17/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {


    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
