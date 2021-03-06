//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aidan Good on 7/23/20.
//  Copyright © 2020 Aidan Good. All rights reserved.
//
// Controller

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    // @Published calls objectWillChange.send() every time the model changes automatically
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // Method that 'makes' the game with the emojis
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "😒", "🤡", "🐶", "🦋", "😝"]
        return MemoryGame<String>(numPairs: Int.random(in: 3...5), cardContentFactory: {(pairIndex: Int) -> String in
            return emojis[pairIndex]
        })
    }
        
    // MARK: -Access to Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // MARK: -Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
