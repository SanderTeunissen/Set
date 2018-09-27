//
//  CardButtonContextFactory.swift
//  Set
//
//  Created by Sander Teunissen on 26-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import UIKit

class CardButtonContextFactory {
    static func generateContextFrom(card: Card) -> NSAttributedString {
        return NSAttributedString(string: getContentStringFor(symbol: card.cardSymbol, nrOfChars: card.cardSymbolCount.rawValue), attributes: getContentAttributes(symbolColor: card.cardSymbolColor, symbolFilling: card.cardSymbolFilling))
    }
    
    private static func getContentStringFor(symbol: CardSymbol,nrOfChars count: Int) -> String {
        var contentString = ""
        var symbolString: String
        
        switch symbol {
        case .symbol1:
            symbolString = "◼︎"
        case .symbol2:
            symbolString = "●"
        case .symbol3:
            symbolString = "▲"
        }
        
        for _ in 0..<count {
            contentString += symbolString
        }
        
        return contentString
    }
    
    private static func getUIColorFrom(symbolColor: CardSymbolColor) -> UIColor {
        switch symbolColor {
        case .color1:
            return UIColor.red
        case .color2:
            return UIColor.blue
        case .color3:
            return UIColor.green
        }
    }
    
    private static func getContentAttributes(symbolColor color: CardSymbolColor, symbolFilling filling: CardSymbolFilling) -> [NSAttributedString.Key: Any] {
        let color = getUIColorFrom(symbolColor: color)
        var attributes: [NSAttributedString.Key: Any] = [:]
        switch filling {
        case .filling1:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color
            break;
        case .filling2:
            attributes[.strokeWidth] = 4
            attributes[.foregroundColor] = color
            break;
        case .filling3:
            attributes[.strokeWidth] = -4
            attributes[.strokeColor] = color
            attributes[.foregroundColor] = color.withAlphaComponent(0.25)
        }
        return attributes
    }
}
