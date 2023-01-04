//
//  PerformanceTuning.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/03.
//

import SwiftUI

// https://blog.canopas.com/swiftui-performance-tuning-tips-and-tricks-a8f9eeb23ec4
struct PerformanceTuning: View {
    var body: some View {
        VStack {
            // MARK: - 1. Use structs instead of classes for your data model
            /**
             SwiftUI는 구조체와 가장 잘 작동합니다. 작업하기 쉽고 성능이 향상될 수 있기 때문입니다. 가능하면 클래스 대신 구조체를 사용하여 데이터를 저장하고 앱에 전달하십시오.
             이것은 참조 유형이고 더 많은 메모리 관리가 필요한 클래스를 사용하는 것보다 더 효율적일 수 있습니다.
             */
            // MARK: - 2. Use lazy stacks and grids when appropriate
            /**
             Lazy Stack과 Grid는 현재 화면에 표시되는 화면만 생성 하므로 많은 목록을 표시할때 효율적이다.
             특히 많은 양의 목록을 표시할때 많은 도움이 된다.
             */
            LazyStackExample()
            
            // MARK: - 3. Use @State and @Binding instead of @ObservedObject or @EnvironmentObject when possible
            /**
             @State와 @Binding은 값이 변할 때 뷰를 다시 그리지만 @ObservedObject와 @EnvironmentObject는 속성이 변경되면 뷰를 다시 그린다.
             */
            
            // MARK: - 4. Use ForEach with an explicit id parameter
            /**
             ForEach를 사용하여 보기 목록을 만들 때 목록의 각 요소를 고유하게 식별하는 id 매개 변수를 지정하는 것이 중요합니다.
             이를 통해 SwiftUI는 목록이 변경될 때 어떤 뷰를 생성, 업데이트 또는 제거해야 하는지 결정하여 성능을 향상시킬 수 있습니다.
             고유한 필드가 있는 객체의 배열이 있는 경우 해당 필드를 id 매개변수의 값으로 설정할 수 있습니다.
             이 동일한 규칙이 목록 보기에 적용되며 동일한 목적을 위한 id 매개변수도 있습니다.
             */
            
            // MARK: - 5. Use .preference(key:value:) to pass data up the view hierarchy
            /**
             뷰를 무효화하고 다시 빌드하는 오버헤드를 방지하므로 @State, @Binding 또는 @EnvironmentObject를 사용하는 것보다 빠를 수 있습니다.
             https://www.youtube.com/watch?v=GuK6wwX8M0E
             */
            PreferenceExample()
            
            // MARK: - 6. Use Text instead of Label when possible
            /**
             Text는 적은 양의 텍스트를 표시하는 데 최적화된 가벼운 보기이고, Label은 더 많은 양의 텍스트나 혼합 콘텐츠를 표시하는 데 더 적합한 더 무거운 보기입니다.
             
             특히 많은 양의 텍스트를 표시할 때 앱의 성능을 개선하는 데 도움이 될 수 있습니다.
             */
            
            // MARK: - 7. Use VStack and HStack instead of ZStack when possible
            
            // MARK: - 8. Use Group to collapse multiple views into a single view hierarchy
            
            // MARK: - 9. Avoid using .onAppear and .onDisappear if possible
            /**
             이러한 수정자는 뷰가 본문을 여러 번 재생성하도록 하여 성능에 부정적인 영향을 줄 수 있습니다.
             대신 절대적으로 필요한 경우에만 사용하거나 .onChange를 사용하여 보기를 보다 선택적으로 업데이트하는 것을 고려하십시오.
             */
            
            // MARK: - 10. Avoid using complex view hierarchies
            
            // MARK: - 11. Use @ViewBuilder to create views conditionally
            /**
             @ViewBuilder 속성을 사용하면 조건부로 뷰를 생성할 수 있으므로 불필요한 뷰 생성 및 레이아웃 작업을 피함으로써 앱의 성능을 개선할 수 있습니다.
             */
            ViewBuilderExample()
            
            // MARK: - 12. Use the environmentObject() modifier to pass data between views
            /**
             위에선 이거 보다 @State, @Binding쓰라고 한거 같은데..
             */
            
            // MARK: - 13. Use AnimatableData and animation() to animate changes to your views
            AnimatableData()
            
            // MARK: - 14. Use canvas to combine multiple draw calls into a single draw call
            CanvasExample()
            
            // MARK: - 15. Use .matchedGeometryEffect to animate changes to your layout
            /**
             https://medium.com/hcleedev/swift-matchedgeometryeffect-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0-150da275b277
             */
            MatchedGeometryEffectExample()
            
            // MARK: - 16. Use redacted(reason:) to temporarily hide views
            /**
             https://seons-dev.tistory.com/135
             */
            
            // MARK: - 17. Use .simultaneousGesture() to handle multiple gestures on a single view
            /**
             한뷰에 중복 제스쳐를 확인하도록 도와준다.
             */
            SimultaneousGestureExample()
            
            // MARK: - 18. Avoid using .transition & .animation(_:) with large numbers of views
            /**
             .transition 과 .animation(_:) modifiers를 사용하면 보기에 대한 변경 사항을 애니메이션으로 만들 수 있지만 많은 수의 보기에 사용하는 데 비용이 많이 들 수 있습니다.
             한 번에 많은 보기에 대한 변경 사항을 애니메이션으로 만들어야 하는 경우 성능을 향상시키기 위해 withAnimation()과 같은 하위 수준 애니메이션 기술을 사용하는 것이 좋습니다.
             */
            
            // MARK: - 19. Avoid using .padding and .frame together
            /**
             동일한 뷰에서 .padding 및 .frame을 모두 사용하면 불필요한 레이아웃 계산이 수행되어 성능에 부정적인 영향을 미칠 수 있습니다.
             
             대신 필요에 따라 둘 중 하나를 사용하십시오.
             */
            // MARK: - 20. Avoid using .clipShape, .shadow() and .overlay together
            
            // MARK: - 21. Use GeometryReader occasionally
            
            // MARK: - 22. Use .fixedSize() to specify the size of views that don't change
            
            // MARK: - 23. Avoid using complex expressions in your view declarations
            
            // MARK: - 24. Use the performance tools in Xcode
            
            
            SimpleGestureExample()
        }
    }
}

struct LazyStackExample: View {
    
    @State var fruits: [String] = ["Orange", "Mango", "Banana", "Graps"]
    
    var body: some View {
        LazyVStack(spacing: 10) {
            ForEach(fruits, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct PreferenceKeys: PreferenceKey {
    static var defaultValue: String = "DEFAULT VALUE"
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = defaultValue
    }
}

struct PreferenceExample: View {
    
    @State private var text: String = "Hello, Readers!"
    
    var body: some View {
        VStack {
            PreferenceSubView(title: text)
                .preference(key: PreferenceKeys.self, value: "NEW VALUE")
        }
        .onPreferenceChange(PreferenceKeys.self) { value in
            text = value
        }
    }
    
}

struct PreferenceSubView: View {
    let title: String
    
    var body: some View {
        Text(title)
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}

struct ViewBuilderExample: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Click Me!") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            .frame(width: 100, height: 50, alignment: .center)
        }
        .if(showDetails) { content in
            ScrollView(.vertical) {
                VStack {
                    content
                    ForEach(0..<10) { index in
                        Text("index : \(index)")
                    }
                }
                
            }
        }
    }
}

struct AnimatableData: View {
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        VStack {
            Circle()
                .fill(isAnimate ? .red : .blue)
                .frame(width: 150, height: 150, alignment: .center)
                .animation(.easeOut(duration: 1), value: isAnimate)
                .onTapGesture {
                    isAnimate.toggle()
                }
        }
    }
}

struct CanvasExample: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                context.fill(Path(ellipseIn: CGRect(origin: .zero, size: size)), with: .color(.blue))
            }
            .frame(width: 300, height: 150)
            .border(Color.red)
        }
    }
}

struct MatchedGeometryEffectExample: View {
    
    @State private var currIndex: Int = 0
    @Namespace var namespace
    
    var body: some View {
        HStack(spacing: 0) {
            ItemView(currIndex: $currIndex, namespace: namespace, itemIndex: 0)
            ItemView(currIndex: $currIndex, namespace: namespace, itemIndex: 1)
        }
        .frame(height: 100)
        .animation(.spring(), value: currIndex)
    }
}

struct ItemView: View {
    @Binding var currIndex: Int
    let namespace: Namespace.ID
    let itemIndex: Int
    
    var body: some View {
        ZStack {
            if currIndex == itemIndex {
                Rectangle()
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: "rect", in: namespace)
            }
            Text("\(itemIndex)")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            currIndex = itemIndex
        }
    }
}

struct SimultaneousGestureExample: View {
    
    @State private var isLongTapped: Bool = false
    @State private var isDoubleTapped: Bool = false
    
    var body: some View {
        Circle()
            .fill(isDoubleTapped ? .blue : .red)
            .frame(width: isLongTapped ? 100 : 200, height: isLongTapped ? 100 : 200)
            .simultaneousGesture(LongPressGesture().onEnded({ _ in
                isLongTapped.toggle()
            }))
            .simultaneousGesture(TapGesture(count: 2).onEnded({
                isDoubleTapped.toggle()
            }))
    }
}

struct PerformanceTuning_Previews: PreviewProvider {
    static var previews: some View {
        PerformanceTuning()
    }
}
