//
//  ContentView.swift
//  Memorize
//
//  Created by 1 on 2022/02/24.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🧀", "🍹", "🍔", "🍣", "🍮", "🍰", "🥪", "🍟", "🥨", "🫒", "🍏", "🥯", "🌮", "🍺", "🍷", "🥞", "🍡", "🧃", "🍨"]
    @State var emojiCount = 4 // 뷰에서 사용되면, 값이 변경될 때마다 뷰도 같이 rebuild됨
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
        .foregroundColor(.red)
    }
    
    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label: {
            VStack {
               Image(systemName: "minus.rectangle.portrait")
            }
        })
    }
    
    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack {
                Image(systemName: "plus.rectangle.portrait")
            }
        })
    }
}

// 🃏Card 하나를 보여주는 뷰
struct CardView: View {
    var content: String
    // @State 임시방편
    // Bool값이 변경되면 뷰를 다시 그려준다(rebuild)
    @State var isFaceUp: Bool = true // 🌟 뷰가 상태(Model value)를 갖고 있다.
                       // ➡️ 자율적으로 모양을 바꿀 수 있다.
                       // ❓뷰와 비지니스 로직간의 결합성이 높아져 재사용성이 줄어드는게 아닐까?
    
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
            .onTapGesture { // 뷰가 이벤트를 받아서 상태를 변화시킬 수 있음
                isFaceUp = !isFaceUp
            }
    }
}

// PreviewProvider: Xcode에서 보여줄 preview를 만드는 타입
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light )
    }
}
