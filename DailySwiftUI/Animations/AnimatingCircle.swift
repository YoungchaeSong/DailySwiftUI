//
//  AnimatingCircle.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2022/12/30.
//

import SwiftUI

struct AnimatingCircle: View {
    
    @State private var scaleInOut: Bool = false
    @State private var rotateInOut: Bool = false
    @State private var moveInOut: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                // MARK: - Circle Set 1
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                    
                }
                .opacity(0.5)
                
                // MARK: - Circle Set 2
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                    
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                // MARK: - Circle Set 3
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                    
                }
                .opacity(0.5)
                .rotationEffect(.degrees(120))
                
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 0.25)
            .animation(Animation.easeOut.repeatForever(autoreverses: true).speed(1/8), value: scaleInOut)
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
}

struct AnimatingCircle_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingCircle()
    }
}
