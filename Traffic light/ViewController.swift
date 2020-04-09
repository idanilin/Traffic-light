//
//  ViewController.swift
//  Traffic light
//
//  Created by Ivan on 31/03/2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
    
    // use enum for recount colors
}

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var buttonForStart: UIButton!
    
    private var currentLight = CurrentLight.red
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOFF: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOFF
        yellowLight.alpha = lightIsOFF
        greenLight.alpha = lightIsOFF
        
        buttonForStart.layer.cornerRadius = 10
              // use value 10 or less
    }

    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
        
        // if you use value .frame.width / 2 for square, you get a circle
    }
      
    @IBAction func buttonForStartPressed() {
        
        buttonForStart.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOFF
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case.yellow:
            redLight.alpha = lightIsOFF
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case.green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOFF
            currentLight = .red
        }
    }
    

}

