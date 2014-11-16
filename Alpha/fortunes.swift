//
//  fortunes.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit

class Fortunes: UIViewController {
    //============================//
    //****** Outlet & Actions ****//
    //============================//
    
    let utility = Utility()
    @IBOutlet weak var fortuneBackground: UIImageView!
    @IBOutlet weak var displayFortune: UILabel!
    
    
    //============================//
    //********** General *********//
    //============================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayFortune.text = fortunes.randomFortune()
        
        var currentTime = utility.currentTime()
        if (currentTime >= 14 ) {
            println("Time is greater then 14")
            fortuneBackground.image = UIImage(named: "fortune_background")
        } else {
            println("Time is not greater then 14")
            fortuneBackground.image = UIImage(named:"morning_fortune_background")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //============================//
    //********** Fortunes ********//
    //============================//
    
    let fortunes = fortunesGroup()
    
    @IBAction func newFortune() {
        displayFortune.text = fortunes.randomFortune()
    }
}