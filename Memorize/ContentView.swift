//
//  ContentView.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/3.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🚒","🛺","🚞","🛳","🚎","🛵","🚡"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                Button {
                    emojiCount += 1
                } label: {
                    VStack{
                        Text("Add Card")
                    }
                }
                Spacer()
                Button {
                    emojiCount -= 1
                } label: {
                    VStack{
                        Text("Remove Card")
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceup: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceup {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }.onTapGesture {
            isFaceup = !isFaceup
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
