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
    var alert: UIAlertController
    
    init(_ text: String) {
        self.text = text
        alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
    }
    
    typealias ShareSheet = SLComposeViewController
    
    func shareTwitter(_ count: Int, action: ((ShareSheet) -> ()), error: ((UIAlertController) -> ())) { // Returns either tweetSheet or alert view
        if (count < 140) {
            if (ShareSheet.isAvailable(forServiceType: SLServiceTypeTwitter)) {
                // Tweets Quote
                let sheet: ShareSheet = ShareSheet(forServiceType: SLServiceTypeTwitter)
                sheet.setInitialText(text)
                action(sheet)
            } else {
                // Not logged into Twitter
                alert.title = "Accounts"
                alert.message = "Please login to a Twitter account to share"
                error(alert)
            }
        } else {
            // Character Count is greater then 140
            alert.title = "Character Count"
            alert.message = "Sorry this is too long to tweet"
            error(alert)
        }
    }
    
    func shareFacebook(_ action: ((ShareSheet) -> ()), error: ((UIAlertController) -> ())) {
        // Shares Quotes to facebook
        if (ShareSheet.isAvailable(forServiceType: SLServiceTypeFacebook)) {
            // Shares Quote
            let sheet: ShareSheet = ShareSheet(forServiceType: SLServiceTypeFacebook)
            sheet.setInitialText(text)
            action(sheet)
        } else {
            // Not logged into facebook
            alert.title = "Accounts"
            alert.message = "Please login to a facebook account to share"
            error(alert)
        }
    }
}
