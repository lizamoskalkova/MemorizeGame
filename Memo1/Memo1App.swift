//
//  Memo1App.swift
//  Memo1
//
//  Created by Elizaveta Moskalkova on 01.09.2021.
//

import SwiftUI

@main
struct Memorize2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
