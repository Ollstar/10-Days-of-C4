//
//  MenuTableViewController.swift
//  Karate
//
//  Created by Oliver Andrews on 2016-05-11.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class MenuTableViewController: UITableViewController {
    var menuItems = ["Jackie Chan", "JCVD", "Ong Bak", "Jet Li", "Bruce Lee"]
    var currentItem = "Jackie Chan"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! KarateTableViewCell
        
        cell.img = Image(menuItems[indexPath.row])
        cell.img!.frame = Rect(canvas.frame.width - 141 ,0,125,125)
        cell.contentView.add(cell.img)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        
        if let selectedRow = menuTableViewController.tableView.indexPathForSelectedRow?.row {
            currentItem = menuItems[selectedRow]
        }
    }
    
}
