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
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                
                Text("Hello, CS193s!")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                
                Text("Hello, CS193s!")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                
                Text("Hello, CS193s!")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                
                Text("Hello, CS193s!")
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
