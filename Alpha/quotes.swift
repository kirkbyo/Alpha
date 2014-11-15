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
    
    let quoteArray = [
        ["Quote 1", "Author 1"],
        ["Quote 2", "Author 2"],
        ["Quote 3", "Author 3"],
        ["Quote 4", "Author 4"]
    ]
    
    func getQuote() {
        var quoteIndex = quoteArray[randomNumber(quoteArray.count)]
        quoteDisplay.text = quoteIndex[0]
        authorDisplay.text = quoteIndex[1]
    }
    
    func randomNumber(arrayLength: Int) -> Int {
        var unsignedArrayCount = UInt32(arrayLength)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return randomNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuote()
    }
    
    @IBAction func newQuote() {
        getQuote()
    }
}