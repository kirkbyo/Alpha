//
//  Utility.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-11-16.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation

struct Utility {
    
    func currentTime() -> Int {
        let calendar = NSCalendar.currentCalendar()
        var date = NSDate()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        println(hour)
        
        return hour
    }
}