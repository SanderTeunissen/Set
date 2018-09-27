//
//  Card.swift
//  Set
//
//  Created by Sander Teunissen on 13-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import UIKit

struct Card : Equatable {
    
    static func ==(firstCard: Card, secondCard: Card) -> Bool {
        return firstCard.cardSymbol == secondCard.cardSymbol &&
            firstCard.cardSymbolCount == secondCard.cardSymbolCount &&
            firstCard.cardSymbolFilling == secondCard.cardSymbolFilling &&
            firstCard.cardSymbolColor == secondCard.cardSymbolColor
    }
    
    let cardSymbol: CardSymbol
    let cardSymbolColor: CardSymbolColor
    let cardSymbolCount: CardSymbolCount
    let cardSymbolFilling: CardSymbolFilling
}

enum CardSymbolColor {
    case color1
    case color2
    case color3
    static let allValues = [color1, color2, color3]
}

enum CardSymbol {
    case symbol1
    case symbol2
    case symbol3
    static let allValues = [symbol1, symbol2, symbol3]
}

enum CardSymbolCount: Int {
    case one = 1, two, three
    static let allValues = [one, two, three]
}

enum CardSymbolFilling {
    case filling1
    case filling2
    case filling3
    static let allValues = [filling1, filling2, filling3]
}
