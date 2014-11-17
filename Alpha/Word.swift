//
//  Word.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-11-15.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit
import Social

class WordsController: UIViewController {
    
    //============================//
    //********** Outlets *********//
    //============================//
    
    let utility = Utility()
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    //============================//
    //********** General *********//
    //============================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            backgroundView.image = UIImage(named: "word_background.png")
        } else {
            backgroundView.image = UIImage(named:"morning_word_background.png")
        }
    }
    
    var word: String = ""
    var definition: String = ""
    
    //============================//
    //********** New Word *********//
    //============================//
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        func randomNumber(arrayLength: Int) -> Int {
            var unsignedArrayCount = UInt32(arrayLength)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)
            
            return randomNumber
        }
        
        // Importing Quotes plist File
        let quotePath = NSBundle.mainBundle().pathForResource("WordsList", ofType: "plist")
        let dictionary: NSDictionary = NSDictionary(contentsOfFile: quotePath!)!
        let wordDictionary: Dictionary = dictionary
        let wordStringArray = [String](map(wordDictionary.keys) { $0 as AnyObject as String })
        
        // Selects Quote
        let chosenWord = wordStringArray[randomNumber(wordDictionary.count)]
        let chosenDefinition = wordDictionary[chosenWord] as NSString as String
        
        // Assigns Quote & Author to IBOutlet
        word = chosenWord
        definition = chosenDefinition
        
        wordLabel.text = word
        definitionLabel.text = definition
    }
    
    
    //============================//
    //***** Sharing Features *****//
    //============================//
    
    @IBAction func shareTweet(sender: AnyObject) {
        
        func shareTwitter(tweetText: String) {
            
            // Gets Length of Quote
            var characterCount: Int = countElements(word)
            
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
                var alert = UIAlertController(title: "Character Count", message: "Sorry this word is too long to tweet", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        shareTwitter("\(word): \(definition)")
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
        shareFacebook("\(word): \(definition)")
    }
}