//
//  FortuneGroup.swift
//  Alpha
//
//  Created by Ozzie Kirkby on 2014-10-19.
//  Copyright (c) 2014 Ozzie Kirkby. All rights reserved.
//

import Foundation

struct fortunesGroup {
    
    let fortuneArray = [
        "A beautiful, smart, and loving person will be coming into your life.",
        "A dubious friend may be an enemy in camouflage.",
        "A feather in the hand is better than a bird in the air.",
        "A fresh start will put you on your way.",
        "A friend asks only for your time not your money.",
        "A friend is a present you give yourself.",
        "A gambler not only will lose what he has, but also will lose what he doesn’t have.",
        "A golden egg of opportunity falls into your lap this month.",
        "A good friendship is often more important than a passionate romance.",
        "A good time to finish up old tasks.",
        "A hunch is creativity trying to tell you something.",
        "A light heart carries you through all the hard times.",
        "A person of words and not deeds is like a garden full of weeds.",
        "A pleasant surprise is waiting for you.",
        "A smooth long journey! Great expectations.",
        "A soft voice may be awfully persuasive.",
        "A truly rich life contains love and art in abundance.",
        "Accept something that you cannot change, and you will feel better.",
        "Adventure can be real happiness.",
        "All the effort you are making will ultimately pay off.",
        "Advice, when most needed, is least heeded.",
        "All will go well with your new project.",
        "All your hard work will soon pay off.",
        "Allow compassion to guide your decisions.",
        "An agreeable romance might begin to take on the appearance.",
        "An important person will offer you support.",
        "Be careful or you could fall for some tricks today.",
        "Because you demand more from yourself, others respect you deeply.",
        "Don’t just think, act!",
        "Don’t just spend time. Invest it.",
        "Don’t let friends impose on you, work calmly and silently.",
        "Everyday in your life is a special occasion.",
        "In order to take, one must first give.",
        "Meditation with an old enemy is advised.",
        "The person who will not stand for something will fall for anything.",
        "The strong person understands how to withstand substantial loss.",
        "The value lies not within any particular thing, but in the desire placed on that thing.",
        "What’s hidden in an empty box?",
        "You always bring others happiness.",
        "You are a person of another time.",
        "You are busy, but you are happy.",
        "You are modest and courteous.",
        "You look pretty.",
        "You love challenge.",
        "You will be blessed with longevity.",
        "You will be successful in your work.",
        "You will become more and more wealthy.",
        "You will travel far and wide, both pleasure and business.",
        "There is a true and sincere friendship between you and your friends.",
        "You find beauty in ordinary things, do not lose this ability",
        "You will be invited to an exciting event.",
        "You will spend old age in comfort and material wealth.",
        "You will live a long, happy life.",
        "You will inherit some money or a small piece of land.",
        "Let there be magic in your smile and firmness in your handshake.",
        "The smart thing is to prepare for the unexpected.",
        "The first step to better times is to imagine them.",
        "None of the secrets of success will work unless you do.",
        "Today is a lucky day for those who remain cheerful and optimistic.",
        "A scholars ink lasts longer than a martyrs blood.",
        "He who laughs at himself never runs out of things to laugh at.",
        "The greatest danger could be your stupidity. ",
        "Do not mistake temptation for opportunity.",
    ]
    
    func randomFortune() -> String {
        var unsignedArrayCount = UInt32(fortuneArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return fortuneArray[randomNumber]
    }
    
}
