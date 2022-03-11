//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/10.
//
//  ViewModle

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚒","🛺","🚞","🛳","🚎","🛵","🚡","🚢","🚔","🚜","🚙","🏎","🚲","🛴","🦼","🦽","✈️","🛫","🛬","🛩","💺","🚂","⛴","🛥"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card]{
        model.cards
    }
    
    
}
