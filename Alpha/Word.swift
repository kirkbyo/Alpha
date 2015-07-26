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
        
        // Checks if time is greater then 3pm to change background
        var currentTime = utility.currentTime()
        if (currentTime >= 15 ) {
            backgroundView.image = UIImage(named: "home_background.png")
        } else {
            backgroundView.image = UIImage(named:"morning_home_background.png")
        }
    }
    
    var word: String = ""
    var definition: String = ""
    
    //============================//
    //********** New Word *********//
    //============================//
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        // Generates a random number
        func randomNumber(arrayLength: Int) -> Int {
            var unsignedArrayCount = UInt32(arrayLength)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)
            
            
            return randomNumber
        }
        
        let words = ImportList(FileName: "WordsList")
        
        // Selects Quote
        let chosenWord: String = words.array[randomNumber(words.count())] as! String
        let chosenDefinition = words.dict[chosenWord]! as String
        
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
        let Meaning = "\(word): \(definition)"
        Share(text: Meaning).shareTwitter(count(Meaning), action: { sheet in
            self.presentViewController(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func shareFacebook(sender: AnyObject) {
        Share(text: "\(word): \(definition)").shareFacebook({ sheet in
            self.presentViewController(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.presentViewController(alert, animated: true, completion: nil)
        })
    }
}