//
//  Share.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2015-05-23.
//  Copyright (c) 2015 Ozzie Kirkby. All rights reserved.
//

import Social
struct Share {
    let text: String

    init(text: String) {
        self.text = text
    }
    
    typealias ShareSheet = SLComposeViewController
    
    func shareTwitter(count: Int, action: (ShareSheet -> ()), error: (UIAlertController -> ())) { // Returns either tweetSheet or alert view
        if (count < 140) {
            if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)) {
                // Tweets Quote
                var sheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                sheet.setInitialText(text)
                action(sheet)
            } else {
                // Not logged into Twitter
                var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                error(alert)
            }
        } else {
            // Character Count is greater then 140
            var alert = UIAlertController(title: "Character Count", message: "Sorry this is too long to tweet", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            error(alert)
        }
    }
    
    func shareFacebook(action: (ShareSheet -> ()), error: (UIAlertController -> ())) {
        // Shares Quotes to facebook
        if (SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)) {
            // Shares Quote
            var sheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            sheet.setInitialText(text)
            action(sheet)
        } else {
            // Not logged into facebook
            var alert = UIAlertController(title: "Accounts", message: "Please login to a facebook account to share", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            error(alert)
        }
    }
    
}