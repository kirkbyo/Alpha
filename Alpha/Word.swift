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
        backgroundView = utility.changeBackgroundOnTime(backgroundView, images: ("morning_home_background.png", "home_background.png"))
    }
    
    var word: String = ""
    var definition: String = ""
    
    //============================//
    //********** New Word *********//
    //============================//
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Generates a random number
        func randomNumber(_ arrayLength: Int) -> Int {
            let unsignedArrayCount = UInt32(arrayLength)
            let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            let randomNumber = Int(unsignedRandomNumber)
            
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
    
    @IBAction func shareTweet(_ sender: AnyObject) {
        let Meaning = "\(word): \(definition)"
        Share(Meaning).shareTwitter(Meaning.characters.count, action: { sheet in
            self.present(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.present(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func shareFacebook(_ sender: AnyObject) {
        Share("\(word): \(definition)").shareFacebook({ sheet in
            self.present(sheet, animated: true, completion: nil)
            }, error: { alert in
                self.present(alert, animated: true, completion: nil)
        })
    }
}
