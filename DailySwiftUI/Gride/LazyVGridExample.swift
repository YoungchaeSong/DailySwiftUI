//
//  LazyVGridExample.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/18.
//

import SwiftUI

struct LazyVGridExample: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.red, .blue, .yellow, .purple, .gray, .pink]
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
//    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    
//    private var gridItemLayout = [GridItem(.adaptive(minimum: 150))]
    
//    private var gridItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(200))]
    
//    private var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0...999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct LazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridExample()
    }
}
