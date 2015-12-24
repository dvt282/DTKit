//
//  HomeViewController.swift
//  UICollectionView
//
//  Created by ThanhDV on 10/26/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let identifierCell = "#"
    var titles = ["iMac","iPhone","iTV","iWatch","iPod","iPad"]
    var images = [UIImage(named: "nature_pic_1"),UIImage(named: "nature_pic_2"),UIImage(named: "nature_pic_3"),UIImage(named: "nature_pic_4"),UIImage(named: "nature_pic_1"),UIImage(named: "nature_pic_2")]
    @IBOutlet weak var colectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colectionView.registerNib(UINib(nibName: "CustomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UICollectionViewDataSource,UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    //MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifierCell , forIndexPath: indexPath) as? CustomeCollectionViewCell
        let title = titles[indexPath.row]
        let image = images[indexPath.row]
        cell?.configureCell(image!, title: title)
        return cell!
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let image = images[indexPath.row]
        if let image = image {
            detail.image = image
        }
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}
