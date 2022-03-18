//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/10.
//
//  ViewModle

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚒","🛺","🚞","🛳","🚎","🛵","🚡","🚢","🚔","🚜","🚙","🏎","🚲","🛴","🦼","🦽","✈️","🛫","🛬","🛩","💺","🚂","⛴","🛥"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // one way is set private(set) var model, don't need var cards below
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    // expose cards parameter via var, better then model.cards
    var cards: [MemoryGame<String>.Card]{
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
