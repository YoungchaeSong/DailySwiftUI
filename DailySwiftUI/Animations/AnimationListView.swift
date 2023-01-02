//
//  AnimationListView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/02.
//

import SwiftUI

enum AnimationType {
    case circle
    
    var title: String {
        switch self {
        case .circle:
            return "원 움직임"
        }
    }
    
    var view: some View {
        switch self {
        case .circle:
            return AnimatingCircle()
        }
    }
}

struct AnimationListView: View {
    
    var animationTypes: [AnimationType] = [.circle]
    
    var body: some View {
        
        VStack {
            List(animationTypes, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Animation Examples")
        }
        
    }
}

struct AnimationListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationListView()
    }
}
