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
    
    //============================//
    //********** Outlets *********//
    //============================//
    
    let utility = Utility()
    @IBOutlet weak var quoteDisplay: UILabel!
    @IBOutlet weak var authorDisplay: UILabel!
    @IBOutlet weak var quoteBackground: UIImageView!
    
    //============================//
    //********** General *********//
    //============================//
    
    let date = NSDate()
    var Author: String = ""
    var Quote: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Checks if time is greater then 3pm to change background
        var currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            quoteBackground.image = UIImage(named: "quote_background.png")
        } else {
            quoteBackground.image = UIImage(named:"morning_quote_background.png")
        }
    }
    
    //============================//
    //********* New Quote ********//
    //============================//
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // Generates Random Number
        func randomNumber(arrayLength: Int) -> Int {
            var unsignedArrayCount = UInt32(arrayLength)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)
            
            
            return randomNumber
        }
        
        // Importing Quotes plist File
        let quotes = ImportList(FileName: "QuotesList")
        
        // Selects Quote
        let chosenQuote: String = quotes.array[randomNumber(quotes.count())] as! String
        let chosenAuthor = quotes.dict[chosenQuote]! as String
        
        // Assigns Quote & Author to IBOutlet
        Author = chosenAuthor
        Quote = chosenQuote
        
        quoteDisplay.text = Quote
        authorDisplay.text = Author.uppercaseString
    }
    
    
    //============================//
    //***** Social Features ******//
    //============================//
    
    @IBAction func shareTweet(sender: AnyObject) {
        Share(text: Quote).shareTwitter(count(Quote), action: { sheet in
            self.presentViewController(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func shareFacebook(sender: AnyObject) {
        Share(text: Quote).shareFacebook({ sheet in
            self.presentViewController(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.presentViewController(alert, animated: true, completion: nil)
        })
    }
}