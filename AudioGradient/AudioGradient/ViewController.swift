//
//  ViewController.swift
//  AudioGradient
//
//  Created by Oliver Andrews on 2016-05-12.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

typealias MusicButton = View

class ViewController: CanvasController {
    
    var gradient: Gradient!
    var isPlaying = false
    let audio = AudioPlayer("Ecstasy.mp3")!
    var timer: Timer!
    var label: UILabel!
    override func setup() {
        
        gradient = createGradient()
        canvas.add(gradient)
        let button = createButton()
        button.center = canvas.center
        canvas.add(button)
        
        timer = Timer(interval: 0.1) {
            self.gradient.colors[0].green = random01()
            self.gradient.colors[0].red = random01()
            self.gradient.colors[1].blue = random01()
            self.gradient.colors[1].green = random01()

            self.gradient.locations = [random01(), random01()]
            self.gradient.startPoint = self.randomPoint()
            self.gradient.endPoint = self.randomPoint()
            
        }
    }
    
    func createButton() -> MusicButton {
        let buttonFrame = Rect(0,0,100,100)
        let button = MusicButton(frame: buttonFrame)
        label = UILabel()
        label.text = "Play"
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.frame = CGRect(button.bounds)
        button.add(label)
        button.backgroundColor = C4Blue
        button.layer?.cornerRadius = CGFloat(button.height/2)
        button.addTapGestureRecognizer { (locations, center, state) in
            self.playMusic()
        }
        return button
    }
    
    func createGradient() -> Gradient {
        let gradient = Gradient(frame: canvas.bounds)
        gradient.startPoint = Point(0,0)
        gradient.endPoint = Point(1,1)
        return gradient
    }
    
    func playMusic() {
        if isPlaying {
            label.text = "Play"
            audio.stop()
            timer.stop()
            isPlaying = false
            return
        }
        label.text = "Stop"

        audio.play()
        timer.start()
        isPlaying = true
    }
    
    func randomPoint() -> Point {
        let x = random01()
        let y = random01()
        return Point(x,y)
    }


}

