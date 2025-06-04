////
////  FrontButtonsView.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 26/05/25.
////
//
//
//import SwiftUI
//import Observation
//import AnimationFoundation
//
//struct FrontButtonsView: View {
//    
//    var appearance: ControllerConfiguration
//    var outerViewRadiusProportion: Double {
//        (appearance.analogStickState == .analogStickEnabled) ? 1.0 : 0
//    }
//    var innerViewsAditionalAngle: Double {
//        (appearance.analogStickState == .analogStickEnabled) ?  2 * .pi : 0
//    }
//    
//    var initialAngle: Double
//    
//    var body: some View {
//        
//        Rectangle()
//            .overlay {
//                
//                RadialLayout(aditionalAngle: initialAngle, radiusProportion: outerViewRadiusProportion) {
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: appearance.downSquareRadius)
//                            .fill(appearance.buttonColor)
//                                .frame(width: appearance.downSquareSize.width, height: appearance.downSquareSize.height)
//                        RoundedRectangle(cornerRadius: appearance.upperSquareRadius)
//                            .fill(appearance.upperSquareColor)
//                            .frame(width: appearance.upperSquareSize.width, height: appearance.upperSquareSize.height)
//                    }
//                    .frame(width: 32, height: 32)
//                    .mask {
//                        Circle()
//                            .frame(width: appearance.maskFrame.width, height: appearance.maskFrame.height)
//                            
//                    }
//                    .rotationEffect(-Angle(radians: innerViewsAditionalAngle), anchor: .center)
//                    
//                    RadialLayout(aditionalAngle: innerViewsAditionalAngle, radiusProportion: 1.0) {
//                        ForEach(0..<appearance.numberOfButtons, id: \.self) { id in
//
//                            RoundedRectangle(cornerRadius: appearance.buttonCornerRadius)
//                                .fill(.black)
//                                .frame(width: appearance.buttonSize.width, height: appearance.buttonSize.height)
//                        }
//                    }
//                    .frame(width: 30, height: 30)
//                }
//            }
//            
//    }
//}
