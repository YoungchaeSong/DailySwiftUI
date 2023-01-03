//
//  ContentView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2022/12/29.
//

import SwiftUI

enum DailySwiftUIType {
    case animation
    case gesture
    case refactoring
    
    var title: String {
        switch self {
        case .animation:
            return "에니메이션"
        case .gesture:
            return "제스쳐"
        case .refactoring:
            return "성능 개선"
        }
    }
    
}

// https://youTube.com/StewartLynch
struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var dailyContentList: [DailySwiftUIType] = [.animation, .gesture]
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List(dailyContentList, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Daily Swift UI")
            .navigationDestination(for: DailySwiftUIType.self) { type in
                switch type {
                case .animation:
                    AnimationListView()
                case .gesture:
                    GestureListView()
                case .refactoring:
                    RefactoringListView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
