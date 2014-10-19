//
//  fortunes.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit

class Fortunes: UIViewController {
    //============================//
    //****** Outlet & Actions ****//
    //============================//
    
    @IBOutlet weak var displayFortune: UILabel!
    
    
    //============================//
    //********** General *********//
    //============================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayFortune.text = fortunes.randomFortune()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //============================//
    //********** Fortunes ********//
    //============================//
    
    let fortunes = fortunesGroup()
    
    @IBAction func newFortune() {
        displayFortune.text = fortunes.randomFortune()
    }
}