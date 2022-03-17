//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/3.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
