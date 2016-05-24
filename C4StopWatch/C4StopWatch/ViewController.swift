//
//  ViewController.swift
//  C4StopWatch
//
//  Created by Oliver Andrews on 2016-05-02.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {

    override func setup() {
        
        let buttonFrame = Rect(0,canvas.height*1/3,canvas.width/2,canvas.height*2/3)
        let playButtonView = View(frame: buttonFrame)
        let pauseButtonView = View(frame: buttonFrame)
        playButtonView.backgroundColor = green
        pauseButtonView.backgroundColor = red
        pauseButtonView.center.x += canvas.width/2
        canvas.add(playButtonView)
        canvas.add(pauseButtonView)
        
        let playLabel = UILabel()
        playLabel.frame = CGRect(playButtonView.bounds)
        playLabel.text = "Play"
        playLabel.textAlignment = .Center
        playLabel.textColor = UIColor.whiteColor()
        playButtonView.add(playLabel)
        
        let pauseLabel = UILabel()
        pauseLabel.frame = CGRect(pauseButtonView.bounds)
        pauseLabel.text = "Stop"
        pauseLabel.textAlignment = .Center
        pauseLabel.textColor = UIColor.whiteColor()
        pauseButtonView.add(pauseLabel)
        
        let topFrame = Rect(0,0,canvas.width,canvas.height*1/3)
        let topView = View(frame: topFrame)
        topView.backgroundColor = blue
        canvas.add(topView)

        let resetFrame = Rect(canvas.width - 125,50,100,50)
        let resetButtonView = View(frame: resetFrame)
        let resetLabel = UILabel()
        resetLabel.frame = CGRect(resetButtonView.bounds)
        resetLabel.text = "Reset"
        resetLabel.textAlignment = .Center
        resetLabel.textColor = UIColor.whiteColor()
        resetButtonView.add(resetLabel)
        resetButtonView.backgroundColor = purple
        canvas.add(resetButtonView)
        
        var counter = 0.0
        
        let textShape = TextShape(text: String(format: "%.1f", counter))!
        textShape.center = topView.bounds.center
        textShape.fillColor = white
        canvas.add(textShape)
        
        let timer = Timer(interval: 0.1) {
            counter += 0.1
            textShape.text = String(format: "%.1f", counter)
            textShape.center = topView.bounds.center
        }
        
        playButtonView.addTapGestureRecognizer { (locations, center, state) in
            timer.start()
        }
        pauseButtonView.addTapGestureRecognizer { (locations, center, state) in
            timer.pause()
        }
        resetButtonView.addTapGestureRecognizer { (locations, center, state) in
            counter = 0.0
            textShape.text = String(format: "%.1f", counter)
            textShape.center = topView.bounds.center
            timer.stop()
        }
        
    }

}

