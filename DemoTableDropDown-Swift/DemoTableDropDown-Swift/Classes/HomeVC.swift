//
//  HomeVC.swift
//  DemoTableDropDown-Swift
//
//  Created by ThanhDV on 9/3/15.
//  Copyright © 2015 AST. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listClass = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        self.setUpData()
    }
    func configView() {
       self.title = "Home"
        let nibName = UINib(nibName: "HomeCell", bundle: nil)
        tableView.registerNib(nibName, forCellReuseIdentifier: "#")

    }
    func setUpData() {
        //Lop IOS
        let ios = ClassItem()
        ios.title = "Lop IOS"
        
        for i in 1...10 {
            let item = StudentItem()
            item.name = "Hoc vien lop IOS \(i+1)"
            ios.students.addObject(item)
        }
        
        //Lop Android
        let android = ClassItem()
        android.title = "Lop Android"
        
        for i in 1...7 {
            let item = StudentItem()
            item.name = "Hoc vien lop Android \(i+1)"
            android.students.addObject(item)
        }
        
        //Lop PHP
        let php = ClassItem()
        php.title = "Lop PHP"
        
        for i in 1...5 {
            let item = StudentItem()
            item.name = "Hoc vien lop PHP \(i+1)"
            php.students.addObject(item)
        }
        
        listClass.addObject(ios)
        listClass.addObject(android)
        listClass.addObject(php)
        print(listClass)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension HomeVC: UITableViewDataSource, UITableViewDelegate, HomeHeaderViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("count:\(listClass.count)")
        return listClass.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item: ClassItem = listClass[section] as! ClassItem
        return item.students.count
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let item = listClass[section] as! ClassItem
        let headerView = NSBundle.mainBundle().loadNibNamed("HomeHeaderView", owner: self, options: nil)![0] as! HomeHeaderView
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50)
        headerView.btMask.tag = section
        headerView.delegate = self
        headerView.lbTitle.text = item.title as String
        
        if item.isSelect {
            headerView.backgroundColor = UIColor.brownColor()
        }else {
            headerView.backgroundColor = UIColor.purpleColor()
        }
     return headerView
    }
    // Cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let item = listClass[indexPath.section] as! ClassItem
        return item.isSelect ? 70:0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("#") as! HomeCell
        let cell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as!HomeCell
        let classItem = listClass[indexPath.section] as! ClassItem
        let stuedntItem = classItem.students[indexPath.section] as! StudentItem
        
        cell.lbTitle.text = stuedntItem.name as String
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    // MARK: - HomeHeaderView
    func didSelectedHeaderWith(index: Int) {
        let item = listClass[index] as! ClassItem
        item.isSelect = !item.isSelect
        
        let indexSet = NSIndexSet(index: index)
        tableView.reloadSections(indexSet, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}
