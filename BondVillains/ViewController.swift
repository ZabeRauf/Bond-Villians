//
//  ViewController.swift
//  BondVillains
//
//  Created by Jason on 11/19/14.
//  Edited by Zaben on 01/14/18.
//  Copyright (c) 2014 Udacity. All rights reserved.
//
/*
 Notice that there is a new project. Open the project and look for the following items:
 
 The Villain Struct
 What are its properties? -> in Villain.swift
 Does it have any custom init methods? -> Has a custom init(dictionary) item.
 How will the static helper methods allow users to construct the model for the app?
 The XCAssets. How are the images tied to the data in the model?
 The View Controller
 How does the view controller get access to the model? -> from allVillains since it's calling to Villain.swift in line 32.
 How are the UITableViewDataSource methods implemented? -> through the data source. UITableview 
 What is the reuse identifier for the cells in this project? (This will be important in the next step) -> allVillains
 Storyboard. What is done so far?
*/

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    // Get ahold of some villains, for the table
    
    // This is an array of Villain instances
    let allVillains = Villain.allVillains

    // MARK: Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allVillains.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainCell")!
        let villain = self.allVillains[(indexPath as NSIndexPath).row]

        // Set the name and image
        cell.textLabel?.text = villain.name
        cell.imageView?.image = UIImage(named: villain.imageName)

        // If the cell has a detail label, we will put the evil scheme in.
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
