//
//  ImportList.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2015-05-23.
//  Copyright (c) 2015 Ozzie Kirkby. All rights reserved.
//

import Foundation

struct ImportList {
    let path: String
    
    init(FileName: String) {
        self.path = NSBundle.mainBundle().pathForResource("\(FileName)", ofType: "plist")!
    }
    
    var dict: Dictionary<String, String> {
        return NSDictionary(contentsOfFile: path)! as! Dictionary
    }
    
    var array: Array<AnyObject> {
        return [String](map(dict.keys) { $0 as AnyObject as! String })
    }
    
    func count() -> Int {
        return array.count
    }
}