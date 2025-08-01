////
////  GameboyTransitionView.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 23/05/25.
////
//
//
//import SwiftUI
//import Observation
//import AnimationFoundation
//
//public struct GameboyTransitionView: View {
//    
//    @State private var isClicked = false
//    @State private var console: HandheldConsole = HandheldConsole.dmg
//    
//    public init() {
//        
//    }
//    
//    public var body: some View {
//        
//        
//        ConsoleLayout(handheldLayout: console.model.handheldLayout) {
//            
////            ConsoleScreenPortion(bezelSize: console.model.bezel.size, screenSize: console.model.screen.size)
////                .drawingGroup()
////                .containerValue(\.handheldLayout, console.model.handheldLayout)
////                .containerValue(\.consoleSection, .consoleScreen)
//            
//            FrontButtonsView(appearance: console.rightControls, initialAngle: 0)
//                .drawingGroup()
////                .containerValue(\.handheldLayout, console.model.handheldLayout)
////                .containerValue(\.consoleSection, .controllerRight)
//            
//            FrontButtonsView(appearance: console.leftControls, initialAngle: 0)
//
//        
//                .drawingGroup()
////                .containerValue(\.handheldLayout, console.model.handheldLayout)
////                .containerValue(\.consoleSection, .controllerLeft)
//            
//        }
//        .drawingGroup()
//        .frame(width: console.model.size.width, height: console.model.size.height)
//        .frame(width: 400, height: 400)
//        .onTapGesture {
//            withAnimation(.bouncy) {
//                isClicked.toggle()
//                console = console.toggled()
//                
//            }
//        }
//        
//        
//    }
//}
//
//#Preview {
//    GameboyTransitionView()
//}
//
//
//
//
//
//
//
//
////struct ConsoleBodyShape: Shape, Animatable {
////
////    var shapeSize: AnimatableSize
////
////    var animatableData: AnimatableSize {
////        get {
////            shapeSize
////        }
////
////        set {
////            shapeSize = newValue
////        }
////    }
////
////    func path(in rect: CGRect) -> Path {
////        var path = Path()
////
////        let dx: Double = (rect.size.width - shapeSize.width) * 0.5
////        let dy: Double = (rect.size.height - shapeSize.height) * 0.5
////
////        path.addRect(rect.insetBy(dx: dx, dy: dy))
////
////        return path
////
////    }
////
////}
//
////struct ConsoleScreenBezelShape: Shape, Animatable {
////
////    var shapeSize: AnimatableSize
////    var offsetSize: AnimatableSize
////
////    var animatableData: AnimatablePair<AnimatableSize, AnimatableSize> {
////        get {
////            AnimatablePair(shapeSize, offsetSize)
////        }
////
////        set {
////            shapeSize = newValue.first
////            offsetSize = newValue.second
////        }
////    }
////
////    func path(in rect: CGRect) -> Path {
////        var path = Path()
////
////        let dx: Double = (rect.size.width - shapeSize.width) * 0.5
////        let dy: Double = (rect.size.height - shapeSize.height) * 0.5
////
////        path.addRect(rect.insetBy(dx: dx, dy: dy).offsetBy(dx: offsetSize.width, dy: offsetSize.height))
////
////        return path
////
////    }
////
////}
//
////#Preview {
////    
////    @Previewable @State var isTapped: Bool = false
////    
////    VStack {
////        RightControlsPortion(bodyColor: .init(red: 0.5, green: 0.1, blue: 0.0), actionButtons: [.aButton, .bButton, .xButton, .yButton], aditionalAngle: isTapped ? .pi : 0, radiusProportion: isTapped ? 1.0 : 0)
////        
////        Button {
////            withAnimation(.smooth) {
////                isTapped.toggle()
////            }
////        } label: {
////            Text("aaaa")
////        }
////            
////    }
////    
////    
////}
