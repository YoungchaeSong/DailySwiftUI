//
//  RefactoringListView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/03.
//

import SwiftUI

enum RefactoringType {
    case performance
    
    var title: String {
        switch self {
        case .performance:
            return "퍼포먼스 개선"
        }
    }
    
}

struct RefactoringListView: View {
    
    var refactoringTypes: [RefactoringType] = [.performance]
    
    var body: some View {
        VStack {
            List(refactoringTypes, id:\.title) { content in
                NavigationLink(content.title, value: content)
            }
            .navigationTitle("Refactoring Examples")
            .navigationDestination(for: RefactoringType.self) { type in
                switch type {
                case .performance:
                    PerformanceTuning()
                }
            }

        }
    }
}

struct RefactoringListView_Previews: PreviewProvider {
    static var previews: some View {
        RefactoringListView()
    }
}
