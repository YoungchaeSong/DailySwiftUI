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
    
}

struct GestureListView: View {
    
    @EnvironmentObject var router: Router
    
    var gestureTypes: [GestureType] = [.longPress]
    
    var body: some View {
        
        VStack {
            List(gestureTypes, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Gesture Examples")
            .navigationDestination(for: GestureType.self) { type in
                switch type {
                case .longPress:
                    LongPressExample()
                }
            }

        }
        
    }
}

struct GestureListView_Previews: PreviewProvider {
    static var previews: some View {
        GestureListView()
            .environmentObject(Router())
    }
}
