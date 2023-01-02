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
    
    var title: String {
        switch self {
        case .circle:
            return "원 움직임"
        case .recordBox:
            return "레코드 박스"
        }
    }
    
}

struct AnimationListView: View {
    
    @EnvironmentObject var router: Router
    
    var animationTypes: [AnimationType] = [.circle, .recordBox]
    
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
