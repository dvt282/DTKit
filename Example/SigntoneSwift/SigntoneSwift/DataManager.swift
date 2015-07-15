//
//  DataManager.swift
//  SigntoneSwift
//
//  Created by Thanh on 7/12/15.
//  Copyright (c) 2015 Thanh. All rights reserved.
//

import UIKit

class DataManager {
  
  var speciesDict: [String : [String]]
  
  var speciesList : [String] {
    var list : [String] = []    
    for speciesName in speciesDict.keys {
      list.append(speciesName)
    }
    list.sort(<)
    return list
  }
  
  
  init() {
    let userDefault = NSUserDefaults.standardUserDefaults()
    if let speciesInfo = userDefault.valueForKey("species") as? [String: [String]] {
      speciesDict = speciesInfo
    }else {
      speciesDict = [
        "Birds" : ["Swift"],
        "Cats"  : ["Presian Cat"],
        "Dogs"  : ["Labrador Retriever"]
      ]
    }
    
  }
  
  func saveData() {
    let userDefault = NSUserDefaults.standardUserDefaults()
    userDefault.setValue(speciesDict, forKey: "species")
  }
  func addRace(species inSpecies: String, race: String) {
    if var races = speciesDict[inSpecies] {
      races.append(race)
      speciesDict[inSpecies] = races
    }
    saveData()
  }
  
  func removeRace(specues inSpecties: String, race inRace: String) {
    if var races = speciesDict[inSpecties] {
      var index = -1
      
      for(idx, race) in enumerate(races) {
        if race == inRace {
          index = idx
          break
        }
      }
      
      if index != -1 {
        races.removeAtIndex(index)
        speciesDict[inSpecties] = races
        saveData()
      }
    }
  }
  
  struct Static {
    static var onceToken : dispatch_once_t = 0
    static var instance : DataManager? = nil
  }
  
  class var SharedInstance : DataManager {
    dispatch_once(&Static.onceToken, { () -> Void in
      Static.instance = DataManager()
    })
    return Static.instance!
  }
}
