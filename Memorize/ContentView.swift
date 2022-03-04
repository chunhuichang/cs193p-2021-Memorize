//
//  ContentView.swift
//  Memorize
//
//  Created by Jill Chang on 2022/3/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceup: false)
            CardView()
            CardView(isFaceup: false)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    @State var isFaceup: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceup {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text("🚓").font(.largeTitle)
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
