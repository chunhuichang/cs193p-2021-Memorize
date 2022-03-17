//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/10.
//
//  Model

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("cards=\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 00..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
