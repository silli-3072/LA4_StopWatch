//
//  ViewController.swift
//  StopWatch
//
//  Created by 春田実利 on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var judgementLabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
        judgementLabel.text = ""
        
    }
    
    @IBAction func stopButton(){
        if timer.isValid {
            timer.invalidate()
        }
        
        judgement()
        
    }
    
    @IBAction func resetButton(){
        if timer.isValid {
            timer.invalidate()
        }
        
        count = 0.0
        
        label.text = String(format: "%.2f", count)
        judgementLabel.text = ""
        
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    func judgement(){
        if count >= 9.8 && count <= 10.2 {
            judgementLabel.text = "PERFECT"
            judgementLabel.textColor = UIColor.red
        } else if count >= 9.7 && count <= 10.3  {
            judgementLabel.text = "GREAT"
            judgementLabel.textColor = UIColor.yellow
        } else if count >= 9.5 && count <= 10.5  {
            judgementLabel.text = "GOOD"
            judgementLabel.textColor = UIColor.green
        } else {
            judgementLabel.text = "BAD"
            judgementLabel.textColor = UIColor.black
        }
        
    }
    
}

