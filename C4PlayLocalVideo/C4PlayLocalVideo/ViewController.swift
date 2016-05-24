//
//  ViewController.swift
//  C4PlayLocalVideo
//
//  Created by Oliver Andrews on 2016-05-02.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class VideoCell: UITableViewCell {
    var movie: Movie?
    var isPlaying = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoTableView: UITableView!

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        
        cell.movie = Movie("step.mov")!
        cell.movie!.frame = Rect(cell.bounds)
        cell.contentView.add(cell.movie!)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! VideoCell
        
        guard let movie = cell.movie else {
            return
        }
        if cell.isPlaying {
            movie.stop()
            cell.isPlaying = false
        } else {
            movie.play()
            cell.isPlaying = true
        }
        
    }
    

}

