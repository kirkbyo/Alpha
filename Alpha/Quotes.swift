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

class QuotesController: UIViewController {
    
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
    
    let date = Date()
    var Author: String = ""
    var Quote: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Checks if time is greater then 3pm to change background
        let currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            quoteBackground.image = UIImage(named: "quote_background.png")
        } else {
            quoteBackground.image = UIImage(named:"morning_quote_background.png")
        }
    }
    
    //============================//
    //********* New Quote ********//
    //============================//
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Generates Random Number
        func randomNumber(_ arrayLength: Int) -> Int {
            let unsignedArrayCount = UInt32(arrayLength)
            let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            let randomNumber = Int(unsignedRandomNumber)
            
            
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
        authorDisplay.text = Author.uppercased()
    }
    
    
    //============================//
    //***** Social Features ******//
    //============================//
    
    @IBAction func shareTweet(_ sender: AnyObject) {
        Share(Quote).shareTwitter(Quote.characters.count, action: { sheet in
            self.present(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.present(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func shareFacebook(_ sender: AnyObject) {
        Share(Quote).shareFacebook({ sheet in
            self.present(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.present(alert, animated: true, completion: nil)
        })
    }
}
