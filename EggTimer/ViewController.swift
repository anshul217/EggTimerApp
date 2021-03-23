//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var progressTimer: UIProgressView!
    @IBOutlet weak var topLabel: UILabel!
    let eggTimer = [ "Soft": 300, "Medium" : 420, "Hard" : 720 ]
    
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 60
    var timePassed = 60
    
    @IBAction func hardnesSelector(_ sender: UIButton) {
        timer.invalidate()
        totalTime = eggTimer[sender.currentTitle!]!
        secondsRemaining = eggTimer[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    @objc func updateTimer(){
        timePassed = totalTime - secondsRemaining
        if secondsRemaining > 0 {
            print(Float((Float(timePassed) / Float(totalTime))))
            progressTimer.progress =  Float((Float(timePassed) / Float(totalTime)))
            secondsRemaining = secondsRemaining - 1
        }else{
            progressTimer.progress = 1
            timer.invalidate()
            topLabel.text = "Done"
        }
        
    }

}
