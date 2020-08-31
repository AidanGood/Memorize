//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aidan Good on 7/23/20.
//  Copyright © 2020 Aidan Good. All rights reserved.
//
// Model

import Foundation

// Create the 'game' struct
struct MemoryGame<CardContent> {
    // Initialize cards array to hold the Card
    var cards: Array<Card>
// TODO: Interaction with cards response
    func choose(card: Card) {
        print("Card Chosen: \(card)")
    }
    
//    Create the cards that make up the game
    init(numPairs: Int, cardContentFactory: (Int) -> CardContent) {
//        Make the array
        cards = Array<Card>()
//        Create the proper number of pairs
        for pair in 0..<numPairs {
            let content = cardContentFactory(pair)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pair*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pair*2+1))
        }
//        Shuffle the array
        cards = cards.shuffled()
    }
//    The Card structure
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
