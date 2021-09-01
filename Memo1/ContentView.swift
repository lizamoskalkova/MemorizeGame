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
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
                .foregroundColor(.red)
            
            /*HStack {
                animals
                Spacer()
                love
                Spacer()
                faces
            }*/
            
        .font(.largeTitle)
        .padding(.horizontal)
                  
        

    }
}
    
    /*var love: some View {
        Button {
            emojis = ["❤️","💔","💛","💙","💚","🖤","💜","❣️"]
            emojiCount = 8
            emojis.shuffle()
        }
        
            label: {
                
                VStack{
                Image(systemName: "heart").font(.largeTitle)
                    Text("Love").font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                }
                
            }
        
    }
    

    var animals: some View {
        Button {
            emojis = ["🐶","🐷","🦋","🦄","🙊","🐻‍❄️","🦉","🐍","🐥"]
            emojiCount = 9
            emojis.shuffle()
        } label: {
            
            VStack {
                Image(systemName: "hare").font(.largeTitle)
                Text("Animals").font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
            }
        }
    }
    var faces: some View {
        Button {
            emojis = ["😃","🙂","😅","🤣","😉","🥲","😌","🥰","😎","😗"]
            emojiCount = 10
            emojis.shuffle()
            
            } label: {
                
                VStack {
                Image(systemName: "person").font(.largeTitle)
                Text("Faces").font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                }
            }
    }
}
*/



struct CardView: View {
    
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
                Text(card.content) } else
            {
                shape.fill()
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
