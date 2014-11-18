//
//  ViewController.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-16.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let utility = Utility()
    
    @IBOutlet weak var quotesButton: UIButton!
    @IBOutlet weak var fortunesButton: UIButton!
    @IBOutlet weak var wordsButton: UIButton!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor: UIColor = UIColor(red: 1.0, green: 1.0, blue:1.0, alpha: 1.0)
        let borderRadius: CGFloat = 1.5
        
        quotesButton.layer.borderColor = borderColor.CGColor
        quotesButton.layer.borderWidth = borderRadius
        
        fortunesButton.layer.borderColor = borderColor.CGColor
        fortunesButton.layer.borderWidth = borderRadius
        
        wordsButton.layer.borderColor = borderColor.CGColor
        wordsButton.layer.borderWidth = borderRadius
        
        var currentTime = utility.currentTime()
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
