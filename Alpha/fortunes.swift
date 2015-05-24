//
//  fortunes.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit
import Social

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
        
        // Checks if time is greater then 3pm to change background
        var currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            fortuneBackground.image = UIImage(named: "fortune_background.png")
        } else {
            fortuneBackground.image = UIImage(named:"morning_fortunes_background.png")
        }
        
    }
    
    //============================//
    //********** Fortunes ********//
    //============================//
    
    let fortunes = fortunesGroup()
    var fortune: String = ""
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        fortune = fortunes.randomFortune()
        displayFortune.text = fortune
    }
    
    
    //============================//
    //***** Sharing Features *****//
    //============================//
    
    @IBAction func shareTweet(sender: AnyObject) {
        let share = Share(text: fortune).shareTwitter(count(fortune))
        if let twitter = share[0] as? SLComposeViewController {
            self.presentViewController(twitter, animated: true, completion: nil)
        } else if let alert = share[0] as? UIAlertController {
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareFacebook(sender: AnyObject) {
        let share = Share(text: fortune).shareFacebook()
        if let facebook = share[0] as? SLComposeViewController {
            self.presentViewController(facebook, animated: true, completion: nil)
        } else if let alert = share[0] as? UIAlertController {
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}