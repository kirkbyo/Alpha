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
        self.path = Bundle.main.path(forResource: "\(FileName)", ofType: "plist")!
    }
    
    var dict: Dictionary<String, String> {
        return NSDictionary(contentsOfFile: path)! as! Dictionary
    }
    
    var array: Array<AnyObject> {
        return [String](dict.keys.map { $0 as AnyObject as! String }) as Array<AnyObject>
    }
    
    func count() -> Int {
        return array.count
    }
}
