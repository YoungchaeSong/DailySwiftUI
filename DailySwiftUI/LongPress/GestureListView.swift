//
//  GestureListView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/02.
//

import SwiftUI

enum GestureType {
    case longPress
    
    var title: String {
        switch self {
        case .longPress:
            return "롱 클릭"
        }
    }
    
    var view: some View {
        switch self {
        case .longPress:
            return LongPressExample()
        }
    }
}

struct GestureListView: View {
    var gestureTypes: [GestureType] = [.longPress]
    
    var body: some View {
        
        VStack {
            List(gestureTypes, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Gesture Examples")
        }
        
    }
}

struct GestureListView_Previews: PreviewProvider {
    static var previews: some View {
        GestureListView()
    }
}
