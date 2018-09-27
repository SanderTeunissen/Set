//
//  Set.swift
//  Set
//
//  Created by Sander Teunissen on 13-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import Foundation

class SetGame {
    weak var delegate: SetGameDelegate?
    
    private(set) var availableCards = [Card]()
    private(set) var cardsInGame = [Card]() {
        didSet{
            if delegate != nil {
                delegate!.viewNeedsUpdate()
            }
        }
    }
    private(set) var selectedCards = [Card]() {
        didSet{
            if delegate != nil {
                delegate!.viewNeedsUpdate()
            }
        }
    }
    
    private(set) var score = 0 {
        didSet {
            if delegate != nil {
                delegate!.change(score: score)
            }
        }
    }
    
    var noMoreCardsAvailable: Bool {
        get {
            return availableCards.count <= 0
        }
    }
    
    init(nrOfCardsToStart: Int) {
        generateCards()
        addCards(nrOfCards: 12)
    }
    
    private func generateCards() {
        for color in CardSymbolColor.allValues {
            for symbol in CardSymbol.allValues {
                for number in CardSymbolCount.allValues {
                    for shading in CardSymbolFilling.allValues {
                        let card = Card(cardSymbol: symbol, cardSymbolColor: color, cardSymbolCount: number, cardSymbolFilling: shading)
                        availableCards.append(card)
                    }
                }
            }
        }
        availableCards.shuffle()
    }
    
    private func addCard() {
        let selectedCard = availableCards.remove(at: availableCards.count.arc4random)
        cardsInGame.append(selectedCard)
    }
    
    func addCards(nrOfCards: Int) {
        if selectedCardsAreMatch() {
            replaceCardsFromSet()
        } else {
            for _ in 0..<nrOfCards{
                if noMoreCardsAvailable {
                    if delegate != nil {
                        delegate?.noMoreCards()
                    }
                    break
                }
                addCard()
            }
        }
    }
    
    func selectedCardsAreMatch() -> Bool {
        if selectedCards.count != 3 {
            return false
        }
        
        if selectedCards[0].cardSymbolColor == selectedCards[1].cardSymbolColor {
            if selectedCards[0].cardSymbolColor != selectedCards[2].cardSymbolColor {
                return false
            }
        } else if selectedCards[1].cardSymbolColor == selectedCards[2].cardSymbolColor {
            return false
        } else if (selectedCards[0].cardSymbolColor == selectedCards[2].cardSymbolColor) {
            return false
        }
        
        if selectedCards[0].cardSymbolCount == selectedCards[1].cardSymbolCount {
            if selectedCards[0].cardSymbolCount != selectedCards[2].cardSymbolCount {
                return false
            }
        } else if selectedCards[1].cardSymbolCount == selectedCards[2].cardSymbolCount {
            return false
        } else if (selectedCards[0].cardSymbolCount == selectedCards[2].cardSymbolCount) {
            return false
        }
        
        if selectedCards[0].cardSymbolFilling == selectedCards[1].cardSymbolFilling {
            if selectedCards[0].cardSymbolFilling != selectedCards[2].cardSymbolFilling {
                return false
            }
        } else if selectedCards[1].cardSymbolFilling == selectedCards[2].cardSymbolFilling {
            return false
        } else if (selectedCards[0].cardSymbolFilling == selectedCards[2].cardSymbolFilling) {
            return false
        }
        
        if selectedCards[0].cardSymbol == selectedCards[1].cardSymbol {
            if selectedCards[0].cardSymbol != selectedCards[2].cardSymbol {
                return false
            }
        } else if selectedCards[1].cardSymbol == selectedCards[2].cardSymbol {
            return false
        } else if (selectedCards[0].cardSymbol == selectedCards[2].cardSymbol) {
            return false
        }
        
        return true
    }
    
    func select(cardAtIndex cardIndex: Int) {
        if cardsInGame.count > cardIndex {
            let card = cardsInGame[cardIndex]
            if selectedCards.has3cards {
                if selectedCardsAreMatch() {
                    replaceCardsFromSet()
                } else {
                    selectedCards.removeAll()
                }
            }
            if selectedCards.hasLessThen3cards{
                selectedCards.append(card)
            }
            if selectedCards.has3cards {
                if selectedCardsAreMatch() {
                    score += 3
                } else {
                    score -= 5
                }
            }
        }
    }
    
    func deselect(cardAtIndex cardIndex: Int) {
        if cardsInGame.count > cardIndex && selectedCards.hasLessThen3cards{
            let card = cardsInGame[cardIndex]
            if let selectedCardInGameIndex = selectedCards.index(of: card) {
                selectedCards.remove(at: selectedCardInGameIndex)
                score -= 1
            }
        }
    }
    
    func replaceCardsFromSet() {
        selectedCards.forEach {
            if let selectedCardInGameIndex = cardsInGame.index(of: $0) {
                if noMoreCardsAvailable {
                    cardsInGame.remove(at: selectedCardInGameIndex)
                } else {
                    let selectedCard = availableCards.remove(at: availableCards.count.arc4random)
                    cardsInGame[selectedCardInGameIndex] = selectedCard
                }
            }
        }
        selectedCards.removeAll()
    }
    
    func getState(ofCard card: Card) -> CardStates{
        if cardsInGame.index(of: card) != nil {
            if selectedCards.index(of: card) != nil {
                if selectedCards.has3cards {
                    if selectedCardsAreMatch() {
                        return .CorrectSet
                    } else {
                        return .InCorrectSet
                    }
                } else {
                    return .ShownAndSelected
                }
            } else {
                return .Shown
            }
        } else {
            return .Empty
        }
    }
}

protocol SetGameDelegate: class {
    func noMoreCards()
    func change(score: Int)
    func viewNeedsUpdate()
}

enum CardStates{
    case Empty, Shown, ShownAndSelected, CorrectSet, InCorrectSet
}
