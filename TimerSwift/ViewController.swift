//
//  ViewController.swift
//  TimerSwift
//
//  Created by kenneth.ng@lifehikes.com on 29/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let levels : [String : Int] = [
        "Small": 30,
        "Medium": 60,
        "Large": 90
    ]
    
    var selectedLevel : String = "Medium"
    var totalSeconds : Int = 60
    var passedSeconds : Int = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
        
        selectedLevel = sender.titleLabel!.text!
        totalSeconds = levels[selectedLevel]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer()
    {
        if passedSeconds < totalSeconds {
            print("\(passedSeconds) of \(totalSeconds) seconds.")
            
            let percent = Float(passedSeconds) / Float(totalSeconds)
            print("progress \(percent) / \(totalSeconds)" )
            progressView.progress = percent
            
            passedSeconds += 1
            
        } else {
            progressView.progress = 0.0
            timer.invalidate()
        }
        
        
    }
    
}

