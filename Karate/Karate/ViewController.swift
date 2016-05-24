//
//  ViewController.swift
//  Karate
//
//  Created by Oliver Andrews on 2016-05-11.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController, MenuTransitionManagerDelegate {

    @IBOutlet weak var playButton: UIButton!
    let menuTransitionManager = MenuTransitionManager()
    var player: AudioPlayer?
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Jackie Chan"
        playButton.layer.cornerRadius = playButton.frame.height/2
        imgView.image = UIImage(named: "Jackie Chan")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        switch self.title! {
        case "Jackie Chan":
            player = AudioPlayer("She was the bomb.mp3")
            player?.play()
        case "JCVD":
            player = AudioPlayer("Lost your balls.mp3")
            player?.play()
        case "Ong Bak":
            player = AudioPlayer("Fighting scream.mp3")
            player?.play()
        case "Jet Li":
            player = AudioPlayer("Breaking_Sound_Barrier-AirMan-1979661165.mp3")
            player?.play()
        case "Bruce Lee":
            player = AudioPlayer("Fighting scream.mp3")
            player?.play()
        default:
            break
        }
    }

    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        
        imgView.image = UIImage(named: sourceController.currentItem)
        self.title = sourceController.currentItem

    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        player?.stop()
        let menuTableViewController = segue.destinationViewController as! MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
    }


}

