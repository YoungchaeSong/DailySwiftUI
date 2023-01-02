//
//  RecordBoxView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/02.
//

import SwiftUI

struct RecordBoxView: View {
    
    @State private var rotateRecord: Bool = false
    @State private var rotateArm: Bool = false
    @State private var shouldAnimate: Bool = false
    @State private var degrees: Double = 0.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 20, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            
            RecordPlayerBox().offset(y: -100)
            
            VStack {
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                ArmView(rotateArm: $rotateArm)
                Button {
                    shouldAnimate.toggle()
                    if shouldAnimate {
                        rotateArm.toggle()
                        degrees = 36000
                        playSound(sound: "music", type: "m4a")
                    } else {
                        rotateArm.toggle()
                        degrees = 0
                        audioPlayer?.stop()
                    }
                } label: {
                    HStack {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else  {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                            
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(.black, lineWidth: 1.25))
                }

            }
        }
    }
}

struct RecordPlayerBox: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

struct RecordView: View {
    
    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool
    
    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(.degrees(degrees))
            .animation(.linear(duration: shouldAnimate ? 60 : 0).delay(1.5), value: shouldAnimate)
    }
}

struct ArmView: View {
    
    @Binding var rotateArm: Bool
    
    var body: some View {
        Image("playerArm")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(.degrees(-35), anchor: .topTrailing)
            .rotationEffect(.degrees(rotateArm ? 8 : 0), anchor: .topTrailing)
            .animation(.linear(duration: 2), value: rotateArm)
            .offset(x: 70, y: -250)
        
    }
}

struct RecordBoxView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecordBoxView()
            RecordView(degrees: .constant(2.0), shouldAnimate: .constant(true ))
                .previewLayout(.sizeThatFits).padding()
            ArmView(rotateArm: .constant(true))
        }
        
    }
}
