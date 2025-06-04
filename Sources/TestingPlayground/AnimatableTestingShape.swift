////
////  AnimatableTestingShape.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 25/05/25.
////
//
//import SwiftUI
//import AnimationFoundation
//
//struct AnimatableTestingShape: Shape, Animatable {
//    
//    
//    var aniRect: AnimatableRect
//    
//    var animatableData: AnimatableRect {
//        get {
//            aniRect
//        }
//        set {
//            aniRect = newValue
//        }
//    }
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: aniRect.position.cgPoint)
//        path.addLine(to: CGPoint(x: 0, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        path.addLine(to: CGPoint(x: aniRect.size.width, y: aniRect.size.height))
//        path.addLine(to: CGPoint(x: 0, y: aniRect.size.height))
//
//        return path
//    }
//    
//    
//}
//
//
//#Preview {
//    
//    @Previewable @State var isTapped: Bool = false
//    
//    AnimatableTestingShape(aniRect: isTapped ? .init(x: -20, y: 10, width: 200, height: 300) : .init(x: 20, y: -30, width: 150, height: 170))
//        .frame(width: 300, height: 300)
//        .onTapGesture {
//            withAnimation {
//                isTapped.toggle()
//            }
//        }
//}
