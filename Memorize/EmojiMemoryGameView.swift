//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aidan Good on 7/21/20.
//  Copyright © 2020 Aidan Good. All rights reserved.
//
// Following along Stanford CS 193p 2020
//
// View

import SwiftUI

struct EmojiMemoryGameView: View {
//    Create the game that shows up on screen
    @ObservedObject var viewModel: EmojiMemoryGame
//    UI on the screen
    var body: some View {
        return HStack(content: {
            return ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture(perform: { self.viewModel.choose(card: card)})
            })
        })
        .foregroundColor(Color.orange)
        .padding()
    }
}

// UI handling how the cards look
struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader(content: { geometry in
            return ZStack(content: {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }
                else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
                }
            })
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
        })
//          Set aspect Ratio to 2/3
            .aspectRatio(2/3, contentMode: .fit)
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
}
































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
