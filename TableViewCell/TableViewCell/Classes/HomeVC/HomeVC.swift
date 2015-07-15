//
//  HomeVC.swift
//  TableViewCell
//
//  Created by ThanhDV on 6/16/15.
//  Copyright © 2015 ThanhDV. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let idenfifier = "CellCustom"
    let idenfifierText = "CellText"
    var arrData : NSMutableArray  = []
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        tableView.registerNib(UINib(nibName: "CellCustom", bundle: nil), forCellReuseIdentifier:idenfifier )
        
        tableView.registerNib(UINib(nibName: "CellText", bundle: nil), forCellReuseIdentifier: idenfifierText)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 211.0
        initData()
        tableView.reloadData()
        
    }
    func initData() {
        arrData = [
            DataObject(imgName: "NatGeo05", heading: "Heading 1", subTitle: "Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1"),
            DataObject(imgName: "NatGeo02", heading: "Heading 2", subTitle: "Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2 Title 2"),
            DataObject(imgName: "NatGeo03", heading: "Heading 3", subTitle: "Title 3 Title 3 Title 3Title 3 Title 3 Title 3Title 3Title 3Title 3 Title 3 Title 3 Title 3"),
            DataObject(imgName: "NatGeo04", heading: "Heading 4", subTitle: "Title 4"),
            DataObject(imgName: "NatGeo05", heading: "Heading 1", subTitle: "Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1"),
            DataObject(imgName: "NatGeo02", heading: "Heading 2", subTitle: "Title 2"),
            DataObject(imgName: "NatGeo03", heading: "Heading 3", subTitle: "Title 3"),
            DataObject(imgName: "NatGeo04", heading: "Heading 4", subTitle: "Title 4"),
            DataObject(imgName: "NatGeo05", heading: "Heading 1", subTitle: "Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1Title 1 Title 1 Title 1 Title 1 Title 1 Title 1Title 1 Title 1"),
            DataObject(imgName: "NatGeo02", heading: "Heading 2", subTitle: "Title 2"),
            DataObject(imgName: "NatGeo03", heading: "Heading 3", subTitle: "Title 3 Title 3Title 3Title 3Title 3Title 3Title 3Title 3Title 3Title 3  vTitle 3 Title 3Title 3Title 3Title 3 Title 3"),
            DataObject(imgName: "NatGeo04", heading: "Heading 4", subTitle: "Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4  Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4  Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4  Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4  Title 4 Title 4 Title 4Title 4 Title 4 Title 4Title 4 Title 4 Title 4 Title 4 v v vvTitle 4Title 4Title 4 Title 4Title 4Title 4 "),

        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
        let cell = tableView.dequeueReusableCellWithIdentifier(idenfifier, forIndexPath: indexPath) as! CellCustom
            cell.initWithData(arrData, indexPath: indexPath)
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier(idenfifierText, forIndexPath: indexPath) as! CellText
            cell.initWithData(arrData, indexPath: indexPath)
            return cell
        }

    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("select row:\(indexPath.row)")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
}
