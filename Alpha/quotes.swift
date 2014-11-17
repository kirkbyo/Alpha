//
//  quotes.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit
import Social

class quotes: UIViewController {
    
    let utility = Utility()
    @IBOutlet weak var quoteDisplay: UILabel!
    @IBOutlet weak var authorDisplay: UILabel!
    @IBOutlet weak var quoteBackground: UIImageView!
    
    let date = NSDate()
    var Author: String = ""
    var Quote: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Checks if time is greater then 3pm to change background
        var currentTime = utility.currentTime()
        if (currentTime >= 14 ) {
            quoteBackground.image = UIImage(named: "quote_background.png")
        } else {
            quoteBackground.image = UIImage(named:"morning_quote_background.png")
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
            func randomNumber(arrayLength: Int) -> Int {
                var unsignedArrayCount = UInt32(arrayLength)
                var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
                var randomNumber = Int(unsignedRandomNumber)
                
                return randomNumber
            }
            
            // Importing Quotes plist File
            let quotePath = NSBundle.mainBundle().pathForResource("QuotesList", ofType: "plist")
            let dictionary: NSDictionary = NSDictionary(contentsOfFile: quotePath!)!
            let quoteDictionary: Dictionary = dictionary
            let quoteStringArray = [String](map(quoteDictionary.keys) { $0 as AnyObject as String })
            
            // Selects Quote
            let chosenQuote = quoteStringArray[randomNumber(quoteDictionary.count)]
            let chosenAuthor = quoteDictionary[chosenQuote] as NSString as String
            
            // Assigns Quote & Author to IBOutlet
            Author = chosenAuthor
            Quote = chosenQuote
            
            quoteDisplay.text = Quote
            authorDisplay.text = Author.uppercaseString
        }
    
    @IBAction func shareTweet(sender: AnyObject) {
        
        func shareTwitter(tweetText: String) {
            
            // Gets Length of Quote
            var characterCount: Int = countElements(Quote)
            
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
                var alert = UIAlertController(title: "Character Count", message: "Sorry this quote is too long to tweet", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        shareTwitter(Quote)
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
        shareFacebook(Quote)
    }
    
    }