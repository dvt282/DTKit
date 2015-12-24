//
//  CustomeCollectionViewCell.swift
//  UICollectionView
//
//  Created by ThanhDV on 10/26/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class CustomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(image: UIImage, title: String) {
        self.imageCell.image = image
        self.titleLable.text = title
    }
}
