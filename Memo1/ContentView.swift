//
//  ContentView.swift
//  Memo1
//
//  Created by Elizaveta Moskalkova on 01.09.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                    CardView(card: card, themeColor: viewModel.themeColor, useGradient: viewModel.useGradient)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
                
                Spacer()
                            
                Button(action: {viewModel.resetGame()}, label: {
                                Text("New Game")
                            })
            }
                .foregroundColor(.red)
            
        .font(.largeTitle)
        .padding(.horizontal)
                  
        
       
    }
}
    



struct CardView: View {
    
    let card: MemoryGame<String>.Card
    let themeColor: Color
    let useGradient: Bool
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                if useGradient {
                                    shape.fill(LinearGradient(gradient: Gradient(colors: [themeColor, Color.pink]), startPoint: .top, endPoint: .bottom))
                                } else {
                                    shape.fill(themeColor)
                                }
            }
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

