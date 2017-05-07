//
//  ViewController.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-16.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //============================//
    //********** Outlets *********//
    //============================//
    
    let utility = Utility()
    @IBOutlet weak var quotesButton: UIButton!
    @IBOutlet weak var fortunesButton: UIButton!
    @IBOutlet weak var wordsButton: UIButton!
    @IBOutlet weak var backgroundView: UIImageView!
    
    //============================//
    //********** General *********//
    //============================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor: UIColor = UIColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        let borderRadius: CGFloat = 1.5
        
        // Adds border on buttons
        quotesButton.layer.borderColor = borderColor.cgColor
        quotesButton.layer.borderWidth = borderRadius
        
        fortunesButton.layer.borderColor = borderColor.cgColor
        fortunesButton.layer.borderWidth = borderRadius
        
        wordsButton.layer.borderColor = borderColor.cgColor
        wordsButton.layer.borderWidth = borderRadius
        
        // Checks if time is greater then 3pm to change background
        let currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            backgroundView.image = UIImage(named: "home_background.png")
        } else {
            backgroundView.image = UIImage(named:"morning_word_background.png")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
