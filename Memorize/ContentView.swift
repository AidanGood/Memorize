//
//  ContentView.swift
//  Memorize
//
//  Created by Aidan Good on 7/21/20.
//  Copyright © 2020 Aidan Good. All rights reserved.
//
// Following along Stanford CS 193p 2020

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        return VStack(content: {
            return ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture(perform: { self.viewModel.choose(card: card)})
            })
        })
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        return ZStack(content: {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }

        })

    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
