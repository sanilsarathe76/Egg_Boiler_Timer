//
//  ViewController.swift
//  EggTimer
//
//  Created by Sanil Sarathe on 05/12/23.
//

import UIKit
enum ButtonType {
    case softEgg
    case mediumEgg
    case hardEgg
}

class ViewController: UIViewController {
    
    var stopTimer = Timer()
        
    var eggBoil = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    
    var softEggCount = Int()
    var midEggCount = Int()
    var hardEggCount = Int()
    
    var count = 0.1
    var progressCount = 0
    
    var onClickButtonType: ButtonType?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0
        // Converting minutes into seconds
        eggBoil.updateValue(5 * 60, forKey: "Soft")
        eggBoil.updateValue(7 * 60 + 1, forKey: "medium")
        eggBoil.updateValue(12 * 60 + 1, forKey: "hard")
        
        // fetching the value of dictionary
        softEggCount = eggBoil["Soft"] ?? 0
        midEggCount = eggBoil["Medium"] ?? 0
        hardEggCount = eggBoil["Hard"] ?? 0
        
        startTimer()
    }
    
    @IBAction func onClickSoftEgg(_ sender: UIButton) {
        onClickButtonType = .softEgg
    }
    
    @IBAction func onClickMidEgg(_ sender: UIButton) {
        onClickButtonType = .mediumEgg
    }
    
    @IBAction func onClickHardEgg(_ sender: UIButton) {
        onClickButtonType = .hardEgg
    }
    
                
    func startTimer() {
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
        
    @objc func updateTime() {
        switch onClickButtonType {
        case .softEgg:
            if softEggCount > 0 {
                softEggCount -= 1
                progressBar.progress = Float(count)
                count += 0.001
                print(count)
            } else {
                titleLabel.text = "DONE!"
                progressBar.progress = 1.0
                break
            }
            print(softEggCount, "Seconds left...")
        case .mediumEgg:
            if midEggCount > 0 {
                midEggCount -= 1
            } else {
                titleLabel.text = "DONE..."
                progressBar.progress = 1.0
                break
            }
            print(midEggCount, "Seconds left...")
        case .hardEgg:
            if hardEggCount > 0 {
                hardEggCount -= 1
            } else {
                titleLabel.text = "DONE..."
                progressBar.progress = 1.0
                break
            }
            print(hardEggCount, "Seconds left...")
        case .none:
            break
        }
    }
}

