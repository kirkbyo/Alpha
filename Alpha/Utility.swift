//
//  Utility.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-11-16.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation
import Social
import UIKit


struct Utility {
    
    func currentTime() -> Int {
        let calendar = NSCalendar.currentCalendar()
        var date = NSDate()
        let components = calendar.components(.CalendarUnitHour, fromDate: date)
        let hour = components.hour
        
        return hour
    }
    
}