//
//  ContentView.swift
//  Memorize
//
//  Created by 1 on 2022/02/24.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["๐ง", "๐", "๐ฃ", "๐ฐ"]
    var body: some View {
        HStack { 
            CardView(content: emojis[0])
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])
        }
        .padding()
        .foregroundColor(.red)
    }
}

// ๐Card ํ๋๋ฅผ ๋ณด์ฌ์ฃผ๋ ๋ทฐ
struct CardView: View {
    var content: String
    // @State ์์๋ฐฉํธ
    // Bool๊ฐ์ด ๋ณ๊ฒฝ๋๋ฉด ๋ทฐ๋ฅผ ๋ค์ ๊ทธ๋ ค์ค๋ค
    @State var isFaceUp: Bool = true // ๐ ๋ทฐ๊ฐ ์ํ(Model value)๋ฅผ ๊ฐ๊ณ  ์๋ค.
                       // โก๏ธ ์์จ์ ์ผ๋ก ๋ชจ์์ ๋ฐ๊ฟ ์ ์๋ค.
                       // โ๋ทฐ์ ๋น์ง๋์ค ๋ก์ง๊ฐ์ ๊ฒฐํฉ์ฑ์ด ๋์์ ธ ์ฌ์ฌ์ฉ์ฑ์ด ์ค์ด๋๋๊ฒ ์๋๊น?
                   
    
    var body: some View {
        ZStack(content: {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        })
            .onTapGesture { // ๋ทฐ๊ฐ ์ด๋ฒคํธ๋ฅผ ๋ฐ์์ ์ํ๋ฅผ ๋ณํ์ํฌ ์ ์์
                isFaceUp = !isFaceUp
            }
    }
}

// PreviewProvider: Xcode์์ ๋ณด์ฌ์ค preview๋ฅผ ๋ง๋๋ ํ์
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light )
    }
}
