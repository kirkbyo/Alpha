//
//  Utility.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-11-16.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import UIKit


struct Utility {
    
    func currentTime() -> Int {
        let calendar = Calendar.current
        let date = Date()
        let components = (calendar as NSCalendar).components(.hour, from: date)
        let hour = components.hour
        
        return hour!
    }
    
    func changeBackgroundOnTime(_ background: UIImageView, images: (day: String, night: String)) -> UIImageView {
        let (day, night) = images
        if (currentTime() >= 15) {
            background.image = UIImage(named: night)
        } else {
            background.image = UIImage(named: day)
        }
        return background
    }
    
}
