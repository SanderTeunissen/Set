//
//  ViewController.swift
//  Set
//
//  Created by Sander Teunissen on 18-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SetGameDelegate {
    private lazy var game = SetGame(nrOfCardsToStart: nrOfCardsToStart)
    private var nrOfCardsToStart = 12
    
    @IBOutlet private var cardButtons: [CardButton]!
    
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private weak var newCardsButton: UIButton!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBAction func newGameButtonClick(_ sender: UIButton) {
        let confirmCheck = UIAlertController(title: "Confirm", message: "Are you sure you want to stop this game?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.startNewGame()
        })
        let cancel = UIAlertAction(title: "No", style: .cancel)
        confirmCheck.addAction(ok)
        confirmCheck.addAction(cancel)
        self.present(confirmCheck, animated: true, completion: nil)
    }
    
    @IBAction func addCardsButtonClick(_ sender: UIButton) {
        if game.selectedCardsAreMatch() {
            game.replaceCardsFromSet()
        } else {
            let availablePlaces = cardButtons.count - game.cardsInGame.count
            if availablePlaces == 0{
                notifyScreenIsFull()
            } else if availablePlaces < 3 {
                game.addCards(nrOfCards: availablePlaces)
            } else {
                game.addCards(nrOfCards: 3)
            }
        }
    }
    
    @IBAction func clickCard(_ sender: CardButton) {
        if let indexOfTheClickedCard = cardButtons.index(of: sender) {
            if sender.currentState == .ShownAndSelected {
                game.deselect(cardAtIndex: indexOfTheClickedCard)
            } else {
                game.select(cardAtIndex: indexOfTheClickedCard)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.delegate = self
        updateViewFromModel()
    }
    
    private func startNewGame(){
        game = SetGame(nrOfCardsToStart: nrOfCardsToStart)
        game.delegate = self
        change(score: 0)
        updateViewFromModel()
    }
    
    private func notifyScreenIsFull() {
        let fullScreenAlert = UIAlertController(title: "Screen is full", message: "There is no room on the screen left for extra cards", preferredStyle: .alert)
        let fullScreenAlertOk = UIAlertAction(title: "OK", style: .default)
        fullScreenAlert.addAction(fullScreenAlertOk)
        self.present(fullScreenAlert, animated: true, completion: nil)
    }
    
    private func updateViewFromModel() {
        enableOrDisableAddCardsButton()
        cardButtons.clearCardsFromButtons()
        for (index, cardButton) in cardButtons.enumerated() {
            if game.cardsInGame.indexInCollection(index: index) {
                let card = game.cardsInGame[index]
                cardButton.setTo(cardIndex: index, withCardContent: CardButtonContextFactory.generateContextFrom(card: card), andState: game.getState(ofCard: card))
            }
        }
    }
    
    private func enableOrDisableAddCardsButton() {
        if (game.selectedCardsAreMatch() || cardButtons.count - game.cardsInGame.count > 0) && !game.noMoreCardsAvailable {
            newCardsButton.isEnabled = true
        } else {
            newCardsButton.isEnabled = false
        }
    }
    
    func noMoreCards() {
        let noMoreCardsAlert = UIAlertController(title: "No more cards", message: "There are no more cards in the game", preferredStyle: .alert)
        let noMoreCardsAlertOk = UIAlertAction(title: "OK", style: .default)
        noMoreCardsAlert.addAction(noMoreCardsAlertOk)
        self.present(noMoreCardsAlert, animated: true, completion: nil)
    }
    
    func change(score: Int) {
        scoreLabel.text = "Score: \(score)"
    }
    
    func viewNeedsUpdate() {
        updateViewFromModel()
    }
}

