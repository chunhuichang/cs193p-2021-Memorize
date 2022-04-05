//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/3.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched, !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstans.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstans.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(5)
                        .opacity(0.5)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstans.fontScale)
    }
    
    private struct DrawingConstans {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.65
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game).previewDevice("iPhone 13").preferredColorScheme(.dark)
        //        EmojiMemoryGameView(game: game).preferredColorScheme(.dark)
        //        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}


struct AnimationView: View {
    @State var upsideDown = true
    
    var body: some View {
        let scary = true
        Text("🚎")
            .font(.system(size: 100))
            .opacity(scary ? 1 : 0)
            .rotationEffect(Angle.degrees(upsideDown ? 180 : 0))
            .animation(.spring(response: 0.2))
            .onTapGesture {
                upsideDown = !upsideDown
            }
    }
    
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView().preferredColorScheme(.dark)
        AnimationView().preferredColorScheme(.light)
    }
}
