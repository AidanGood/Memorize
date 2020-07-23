//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aidan Good on 7/23/20.
//  Copyright © 2020 Aidan Good. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card Chosen: \(card)")
    }
    
    init(numPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pair in 0..<numPairs {
            let content = cardContentFactory(pair)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pair*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pair*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
