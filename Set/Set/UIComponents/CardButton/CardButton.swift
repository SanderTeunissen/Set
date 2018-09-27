//
//  CardButton.swift
//  Set
//
//  Created by Sander Teunissen on 18-09-18.
//  Copyright © 2018 Sander Teunissen. All rights reserved.
//

import UIKit

class CardButton: UIButton {
    private(set) var currentState: CardStates = .Empty{
        didSet{
            setTo(state: currentState)
        }
    }
    
    private(set) var cardContent: NSAttributedString? {
        didSet{
            if cardContent == nil{
                currentState = .Empty
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultStyle()
        setTo(state: currentState)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDefaultStyle()
        setTo(state: currentState)
    }
    
    func setTo(cardIndex index: Int, withCardContent content: NSAttributedString, andState state: CardStates = .Shown) {
        cardContent = content
        currentState = state
    }
    
    func clear() {
        cardContent = nil
    }
    
    private func setTo(state: CardStates){
        switch state {
        case .Empty:
            setAttributedTitle(nil, for: [])
            layer.borderColor = UIColor.white.cgColor
            layer.shadowRadius = 0;
            break
        case.Shown:
            setAttributedTitle(cardContent, for: [])
            layer.shadowRadius = 2
            layer.shadowColor = UIColor.gray.cgColor
            layer.borderColor = UIColor.white.cgColor
            break
        case .ShownAndSelected:
            setAttributedTitle(cardContent, for: [])
            layer.shadowRadius = 2
            layer.shadowColor = UIColor.gray.cgColor
            layer.borderColor = UIColor.backgroundPurple.cgColor
            break
        case .CorrectSet:
            setAttributedTitle(cardContent, for: [])
            layer.shadowRadius = 2
            layer.shadowColor = UIColor.gray.cgColor
            layer.borderColor = UIColor.green.cgColor
        case .InCorrectSet:
            setAttributedTitle(cardContent, for: [])
            layer.shadowRadius = 2
            layer.shadowColor = UIColor.gray.cgColor
            layer.borderColor = UIColor.red.cgColor
        }
    }
    
    private func setDefaultStyle() {
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize.zero
        titleLabel!.minimumScaleFactor = 1
        titleLabel!.adjustsFontSizeToFitWidth = true;
        titleLabel!.lineBreakMode = .byCharWrapping;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch currentState {
        case .Shown, .ShownAndSelected, .InCorrectSet:
            super.touchesEnded(touches, with: event)
            break
        case .Empty, .CorrectSet:
            break
        }
    }

}
