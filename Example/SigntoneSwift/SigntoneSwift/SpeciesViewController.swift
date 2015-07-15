//
//  SpeciesViewController.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class SpeciesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var species: [String] = DataManager.SharedInstance.speciesList
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "#")
    
    title = "Species"
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return species.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell
    cell?.textLabel?.text = species[indexPath.row]
    cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    
    return cell!
    
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    var racesVC = storyboard?.instantiateViewControllerWithIdentifier("RacesViewController") as? RacesViewController
    racesVC?.speciesString = species[indexPath.row]
    self.navigationController?.pushViewController(racesVC!, animated: true)
    
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

