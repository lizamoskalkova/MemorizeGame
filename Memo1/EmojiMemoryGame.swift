//
//  EmojiMemoryGame.swift
//  Memo1
//
//  Created by Elizaveta Moskalkova on 01.09.2021.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    //static let emojis = ["🚗","🚜","🛴", "🚚","g","as","a","aa","e"]
    static var themes: [Theme<String>] = [
            Theme(themeName: "Vehicles", setOfEmojiForTheme: ["🚗", "⛵️", "🚜", "🚲", "🚕", "🚌", "🚁", "🛶", "🛸", "🚒", "🚖", "🛴"], numberOfPairs: 6, themeColor: "red"),
            Theme(themeName: "Barn Animals", setOfEmojiForTheme: ["🐔", "🐥", "🐮", "🐷", "🐭", "🐑", "🐖", "🐓"], numberOfPairs: 5, themeColor: "yellow"),
            Theme(themeName: "Faces", setOfEmojiForTheme: ["👳‍♂️", "👩‍🦰", "👨🏽", "🧑🏿‍🦲", "👩🏻‍🦱", "👴", "👱🏽‍♀️", "👶🏻", "👦🏼", "🧔🏻", "👧🏽", "👱🏻‍♂️", "👵🏻", "🧓🏾"], numberOfPairs: Int.random(in: 5..<8), themeColor: "blue", useGradient: true),
            Theme(themeName: "Bugs", setOfEmojiForTheme: ["🐝", "🐛", "🦋", "🐞", "🐜", "🦟", "🦗", "🕷", "🦂", "🐌"], numberOfPairs: 8, themeColor: "green"),
            Theme(themeName: "Flags", setOfEmojiForTheme: ["🇳🇴", "🇸🇪", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🇬🇧", "🇮🇪", "🇨🇦"], numberOfPairs: 8, themeColor: "purple", useGradient: true),
            Theme(themeName: "Halloween", setOfEmojiForTheme: ["👻", "🎃", "🕷", "🦇", "💀"], themeColor: "orange")
        ]
   
    
    
    @Published var model: MemoryGame<String> 
    @Published private var currentTheme: Theme<String>
    
    init() {
            let theme  = EmojiMemoryGame.themes.randomElement()!
            model = EmojiMemoryGame.createMemoryGame(with: theme)
            currentTheme = theme
        }
    
    static func createMemoryGame(with theme: Theme<String>) -> MemoryGame<String> {
            let shuffledSetOfEmojis = theme.setOfEmojiForTheme.shuffled()
            
            return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs!) { pairIndex in  //added a force unwrap of numberOfPairs
                //theme.setOfEmojiForTheme[pairIndex]
                shuffledSetOfEmojis[pairIndex]
            }
        }
        
        
        var cards: Array<MemoryGame<String>.Card> {
            model.cards
        }
        
       
        
        var themeName: String {
            currentTheme.themeName
        }
        
        var useGradient: Bool {
            currentTheme.useGradient
        }
        
        var themeColor: Color {
            let stringColor = currentTheme.themeColor
            
            switch stringColor {
            case "red":
                return .red
            case "green":
                return .green
            case "blue":
                return .blue
            case "orange":
                return .orange
            case "yellow":
                return .yellow
            case "purple":
                return .purple
            case "pink":
                return .pink
            case "black":
                return .black
            default:
                return .gray
            }
        }
        
        // MARK: - Intent(s)
        
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
        
        func resetGame() {
            currentTheme = EmojiMemoryGame.themes.randomElement()!
            model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
        }
    }
