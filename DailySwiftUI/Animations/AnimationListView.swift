//
//  AnimationListView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/02.
//

import SwiftUI

enum AnimationType {
    case circle
    case recordBox
    case transition
    
    var title: String {
        switch self {
        case .circle:
            return "원 움직임"
        case .recordBox:
            return "레코드 박스"
        case .transition:
            return "트렌지션"
        }
    }
    
}

struct AnimationListView: View {
    
    @EnvironmentObject var router: Router
    
    var animationTypes: [AnimationType] = [.circle, .recordBox, .transition]
    
    var body: some View {
        
        VStack {
            List(animationTypes, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Animation Examples")
            .navigationDestination(for: AnimationType.self) { type in
                switch type {
                case .circle:
                    AnimatingCircle()
                case .recordBox:
                    RecordBoxView()
                case .transition:
                    AnimateTransitionView()
                }
            }

        }
        
    }
}

struct AnimationListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationListView()
            .environmentObject(Router())
    }
}
