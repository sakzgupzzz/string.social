//
//  Tools.swift
//  string.social
//
//  Created by Saksham Gupta on 4/3/24.
//
import SwiftUI
import Foundation

func middlePoint(geometry: GeometryProxy) -> CGPoint {
    let screenWidthMid = geometry.size.width/2
    let screenHeightMid = geometry.size.height/2
    return CGPoint(x: screenWidthMid, y: screenHeightMid)
}


struct SlideFromRightTransition: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TransitionModifier())
    }
    
    private struct TransitionModifier: ViewModifier {
        @State private var isPresenting = false
        
        func body(content: Content) -> some View {
            content
                .offset(x: isPresenting ? 0 : UIScreen.main.bounds.width)
                .animation(.easeInOut(duration: 0.5))
                .onAppear {
                    isPresenting = true
                }
        }
    }
}
