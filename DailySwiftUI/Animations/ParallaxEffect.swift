//
//  ParallaxEffect.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/04.
//

import SwiftUI

// .rotationEffect : https://kka7.tistory.com/284
// .rotation3DEffect : https://ashishkakkad.medium.com/swiftui-animations-3d-rotation-effect-fb8dd5b86df
struct ParallaxEffect: View {
    
    @State private var rotation = 0.0
    @State private var animate1 = false
    @State private var animate2 = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .colorInvert()
                .edgesIgnoringSafeArea(.all )
            VStack {
                Slider(value: $rotation, in: 0...360, step: 1.0)
                                
                Text("Parallax Effect")
                    .font(.title)
                    .fontWeight(.semibold)
//                    .rotationEffect(.degrees(rotation), anchor: .leading)
                    .rotation3DEffect(.degrees(animate2 ? 0 : 720), axis: (x: 0, y: 1, z: 0))
                    .animation(.easeOut(duration: 3.5).repeatForever(autoreverses: true), value: animate2)
                    .onAppear() {
                        animate2.toggle()
                    }
                    .padding(30)
                
                VStack {
                    Image("wolf")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 30, x: 5, y: 5)
                }
                .rotation3DEffect(.degrees(animate1 ? 13 : -13), axis: (x: animate1 ? 90 : -45, y: animate1 ? -45 : -90, z: 0))
                .animation(.easeOut(duration: 3.5).repeatForever(autoreverses: true), value: animate1)
                .onAppear() {
                    animate1.toggle()
                }
                .padding(30)
                
            }
        }
    }
}

struct ParallaxEffect_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxEffect()
    }
}
