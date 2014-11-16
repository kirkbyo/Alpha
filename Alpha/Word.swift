//
//  Word.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-11-15.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit

class WordsController: UIViewController {
    
    let utility = Utility()
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentTime = utility.currentTime()
        if (currentTime >= 14 ) {
            println("Time is greater then 14")
            backgroundView.image = UIImage(named: "word_background")
        } else {
            println("Time is not greater then 14")
            backgroundView.image = UIImage(named:"morning_word_background")
        }
    }
    
    var word: String = ""
    var definition: String = ""
    
    @IBAction func newWord() {
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
    
}