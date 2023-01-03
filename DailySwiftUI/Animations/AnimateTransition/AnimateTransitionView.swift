//
//  AnimateTransitionView.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2023/01/03.
//

import SwiftUI

struct AnimateTransitionView: View {
    var body: some View {
        OpenSettingView()
    }
}

struct PresentandDismiss: GeometryEffect {

    var offsetValue: Double
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationOffset = offsetValue
        let angleOfRotation = CGFloat(Angle(degrees: 95 * (1 - rotationOffset)).radians)
        var tranform3D = CATransform3DIdentity
        tranform3D.m34 = -1 / max(size.width, size.height)
        
        tranform3D = CATransform3DRotate(tranform3D, angleOfRotation, 1, 0, 0)
        tranform3D = CATransform3DTranslate(tranform3D, -size.width/2.0, -size.height/2.0, 0)
        
        let transformAffine1 = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0))
        let transformAffine2 = ProjectionTransform(CGAffineTransform(translationX: CGFloat(offsetValue * 2), y: CGFloat(offsetValue * 2)))
        
        if offsetValue <= 0.5 {
            return ProjectionTransform(tranform3D).concatenating(transformAffine2).concatenating(transformAffine1)
        } else {
            return ProjectionTransform(tranform3D).concatenating(transformAffine1)
        }
    }
}

struct OpenSettingView: View {
    
    @State private var isShowing = false
    
    let gradientBackgroung = Gradient(colors: [.black, .white, .black])
    let buttonBorderGradient = LinearGradient(gradient: Gradient(colors: [.black, .white, .black]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: gradientBackgroung, startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Wake Up")
                        .foregroundColor(.black)
                        .font(.title)
                    Image(systemName: "clock")
                        .font(.largeTitle)
                }
                .offset(y: -25)
                
                Button {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.isShowing = true
                    }
                } label: {
                    Image(systemName: "gear")
                        .font(Font.system(size: 20).weight(.bold))
                }
                .padding(10)
                .background(.orange)
                .cornerRadius(30)
                .foregroundColor(.black)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(buttonBorderGradient, lineWidth: 5)
                        .shadow(color: .gray, radius: 5)
                )
                .offset(y: 200)

                if isShowing {
                    SettingView(show: $isShowing)
                        .transition(.fly)
                        .zIndex(1)
                }
            }
        }
    }
}

extension AnyTransition {
    static var fly: AnyTransition {
        get {
            AnyTransition.modifier(active: PresentandDismiss(offsetValue: 0), identity: PresentandDismiss(offsetValue: 1))
        }
    }
}

struct AnimateTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateTransitionView()
    }
}
