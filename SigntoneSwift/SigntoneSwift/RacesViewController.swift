//
//  RacesViewController.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class RacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {

  var speciesString : String!
  
  var racesString: [String] {
    return DataManager.SharedInstance.speciesDict[speciesString]!
  }
  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

      title = speciesString
      tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "#")
    }

  @IBAction func didTapAdd(sender: UIBarButtonItem) {
    
    var alert: UIAlertView = {
      var alert = UIAlertView()
      alert.title = "New Race"
      alert.message = "Type in new race"
      alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
      alert.delegate = self
      alert.addButtonWithTitle("Cancel")
      alert.addButtonWithTitle("Add")
      return alert
    }()
    alert.show()
    
  }
  func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    switch buttonIndex {
    case 1 :
      var textField = alertView.textFieldAtIndex(0)!
      var newRace = textField.text.capitalizedString
      
      DataManager.SharedInstance.addRace(species: speciesString, race: newRace)
      
      var newIndexPath = NSIndexPath(forRow: racesString.count - 1, inSection: 0)
      tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    default: break
    }
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return racesString.count
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell
    cell?.textLabel?.text = racesString[indexPath.row]
    cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    return cell!
    
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

  }
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    var raceToremove = racesString[indexPath.row]
    
    DataManager.SharedInstance.removeRace(specues: speciesString, race: raceToremove)
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
  }

}
