//
//  quotes.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit

class quotes: UIViewController {
    
    @IBOutlet weak var quoteDisplay: UILabel!
    @IBOutlet weak var authorDisplay: UILabel!
    
    var Author: String = ""
    var Quote: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newQuote() {
        
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
        authorDisplay.text = Author
    }
}