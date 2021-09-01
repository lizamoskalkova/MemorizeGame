//
//  EmojiMemoryGame.swift
//  Memo1
//
//  Created by Elizaveta Moskalkova on 01.09.2021.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚗","🚜","🛴", "🚚","g","as","a","aa","e"]
   
    static func createMemoryGame() -> MemoryGame<String> {
           MemoryGame<String>(numberOfPairsOfCards: 4) {
           pairIndex in emojis[pairIndex]
           }
    }
    
    @Published var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
