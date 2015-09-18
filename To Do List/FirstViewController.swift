//
//  FirstViewController.swift
//  To Do List
//
//  Created by TangWeichang on 8/7/15.
//  Copyright © 2015 TangWeichang. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    

    @IBOutlet var toDoListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        
        }
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    
    // Swipe to the left to "Delete"
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete  {
            
            toDoList.removeAtIndex(indexPath.row) // Update the data
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList") // Update the permanent data
            
            toDoListTable.reloadData() // Update the table
            
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }


}

