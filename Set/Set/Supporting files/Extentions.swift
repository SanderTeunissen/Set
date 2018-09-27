//
//  Extentions.swift
//  Set
//
//  Created by Sander Teunissen on 19-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import UIKit

extension UIColor {
    static let backgroundBlue = UIColor(red:0.15, green:0.82, blue:1.00, alpha:1.0)
    static let backgroundPurple = UIColor(red:0.53, green:0.14, blue:0.91, alpha:1.0)
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self))) }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

extension Collection where Iterator.Element == Card {
    var has3cards: Bool {
        return count == 3
    }
    
    var hasLessThen3cards: Bool {
        return count < 3
    }
    
    func indexInCollection(index: Int) -> Bool {
        return count > index && index >= 0
    }
}

extension Collection where Iterator.Element == CardButton {
    func clearCardsFromButtons() {
        for element in self {
            element.clear()
        }
    }
}
