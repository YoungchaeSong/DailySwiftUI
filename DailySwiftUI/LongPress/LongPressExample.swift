//
//  LongPressExample.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/02.
//

import SwiftUI

// https://medium.com/devtechie/longpress-gesture-in-swiftui-a563c6a59215
struct LongPressExample: View {
    
    @GestureState var isUpdating = false
    @State var show = false
    
    var body: some View {
        Image(systemName: "tornado")
            .foregroundColor(.white)
            .frame(width: 100, height: 100)
            .background(show ? Color.black : Color.orange)
            .clipShape(Circle())
            .scaleEffect(isUpdating ? 2 : 1)
            .animation(.spring(response: 0.6, dampingFraction: 0.1), value: isUpdating)
            .gesture(
                LongPressGesture(minimumDuration: 3)
                    .updating($isUpdating) { currentState, gestureState, transaction in
                        // gestureState is the same property as @GestureState isUpdating and currentState represents the new state but the type is same as the GestureState
                        print("updating")
                        gestureState = currentState
                    }
                    .onEnded { value in
                        print("onEnded")
                        show.toggle()
                    }
            )
    }
}

struct LongPressExample_Previews: PreviewProvider {
    static var previews: some View {
        LongPressExample()
    }
}
