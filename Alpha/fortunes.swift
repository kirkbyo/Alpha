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
        displayFortune.text = fortunes.randomFortune()
        
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        displayFortune.text = fortunes.randomFortune()
    }
    
    @IBAction func shareTweet(sender: AnyObject) {
        
        func shareTwitter(tweetText: String) {
            
            // Gets Length of Quote
            var characterCount: Int = countElements(fortunes.randomFortune())
            
            if (characterCount < 140) {
                
                if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)) {
                    
                    // Tweets Quote
                    var tweetSheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    tweetSheet.setInitialText("\(tweetText)")
                    self.presentViewController(tweetSheet, animated: true, completion: nil)
                    
                } else {
                    
                    // Not logged into Twitter
                    var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            } else {
                // Character Count is greater then 140
                var alert = UIAlertController(title: "Character Count", message: "Sorry this fortune is too long to tweet", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        shareTwitter(fortunes.randomFortune())
    }
    
    @IBAction func shareFacebook(sender: AnyObject) {
        
        func shareFacebook(facebookText: String) {
            
            // Shares Quotes to facebook
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)) {
                // Shares Quote
                var tweetSheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                tweetSheet.setInitialText("\(facebookText)")
                self.presentViewController(tweetSheet, animated: true, completion: nil)
                
            } else {
                // Not logged into facebook
                var alert = UIAlertController(title: "Accounts", message: "Please login to a facebook account to share", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        shareFacebook(fortunes.randomFortune())
    }
}