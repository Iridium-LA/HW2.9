//
//  ViewController.swift
//  HW2.9
//
//  Created by Игорь Зигура on 19.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    var nextAnimation = AnimationBase.shared.animations.randomElement() ?? "slideLeft"
        
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationButton.setTitle("Start (A: \(nextAnimation))", for: UIControl.State.normal)
    }
    
    @IBAction func changeAnimationButtonPush(_ sender: SpringButton) {
        
        animationView.animation = nextAnimation
        animationView.curve = AnimationBase.shared.curves.randomElement() ?? "easeIn"
        animationView.force = 2
        animationView.duration = 2
        
        animationLabel.text = "A: \(animationView.animation), \n C: \(animationView.curve) "
        
        animationView.animate()
        
        nextAnimation = AnimationBase.shared.animations.randomElement() ?? "slideLeft"
        sender.setTitle("Next: \(nextAnimation)", for: UIControl.State.normal)
    }
       
}

