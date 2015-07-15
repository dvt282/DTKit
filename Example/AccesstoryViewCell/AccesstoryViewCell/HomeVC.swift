//
//  HomeVC.swift
//  AccesstoryViewCell
//
//  Created by Thanh on 7/11/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var datas: NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.loadData()
    }
  func loadData() {
      let pathFile = NSBundle.mainBundle().pathForResource("data", ofType: "plist")

      datas   = NSMutableArray(contentsOfFile: pathFile!)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datas.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell: UITableViewCell!
    if let dequeueCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
      cell = dequeueCell
    }else {
      cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "#")
    }
    let item: AnyObject = datas[indexPath.row]
    cell.textLabel?.text = item.objectForKey("text") as? String
    
    var customView = CustomeCheck(checkImage: UIImage(named: "check")!, unCheckImage: UIImage(named: "uncheck")!)
    customView.check = (item.objectForKey("check") as? Bool)!
    customView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapGesture:")))
    cell.accessoryView = customView as CustomeCheck
    return cell
  }
  func tapGesture(tapGesture: UITapGestureRecognizer) {
    let tapPosition = tapGesture.locationInView(self.tableView)
    if let indexPath = self.tableView.indexPathForRowAtPoint(tapPosition) {
      handleCheck(indexPath)
    }
  }
  func handleCheck(indexPath: NSIndexPath) {
    var item = datas[indexPath.row] as! NSMutableDictionary
    item["check"] = !(item["check"] as! Bool)
    
    if let cell = self.tableView.cellForRowAtIndexPath(indexPath) {
      (cell.accessoryView as! CustomeCheck).check = item["check"] as! Bool
    }
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    handleCheck(indexPath)
  }
}