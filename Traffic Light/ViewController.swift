//
//  ViewController.swift
//  Traffic Light
//
//  Created by Пупка on 19.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLabel: UIView!
    @IBOutlet weak var yellowLabel: UIView!
    @IBOutlet weak var greenLabel: UIView!
    
    var currentLight: Light = .red
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setRoundCorners()

        redLabel.alpha = 1
        yellowLabel.alpha = 0.3
        greenLabel.alpha = 0.3
    }

    @IBAction func trafficLightButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        button.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            changeLights(turnOff: redLabel, turnOn: yellowLabel)
        case .yellow:
            currentLight = .green
            changeLights(turnOff: yellowLabel, turnOn: greenLabel)
        case .green:
            currentLight = .red
            changeLights(turnOff: greenLabel, turnOn: redLabel)
        }
        
    }

    func changeLights(turnOff: UIView, turnOn: UIView) {
        UIView.animate(withDuration: 0.5) {
            turnOn.alpha = 1
            turnOff.alpha = 0.3
        }
    }
    
    func setRoundCorners() {
        redLabel.layer.cornerRadius = redLabel.frame.height / 2
        yellowLabel.layer.cornerRadius = yellowLabel.frame.height / 2
        greenLabel.layer.cornerRadius = greenLabel.frame.height / 2
    }
}

enum Light {
    case red
    case yellow
    case green
}

