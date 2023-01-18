//
//  LazyHGridExample.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/18.
//

import SwiftUI

struct LazyHGridExample: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.red, .blue, .yellow, .purple, .gray, .pink]
    
    private var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 20) {
                ForEach((0...999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
//                        .resizable()
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct LazyHGridExample_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridExample()
    }
}
