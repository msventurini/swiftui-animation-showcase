////
////  DirectionalButtonAppearanceState.swift
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
//protocol ControllerAppearanceState {
//    
//    var analogStickState: AnalogStickState { get set }
//    var aditionalAngle: Double { get }
//    var buttonColor: Color { get }
//    var upperSquareColor: Color { get }
//    var maskFrame: CGSize { get }
//    var side: ControlerSide { get }
//    var upperSquareRadius: Double { get }
//    var upperSquareSize: CGSize { get }
//    var downSquareSize: CGSize { get }
//    var downSquareRadius: Double { get }
//    var buttonSize: CGSize { get }
//    var buttonCornerRadius: Double { get }
//}
//
//extension ControllerAppearanceState {
//    var aditionalAngle: Double {
//        switch analogStickState {
//        case .analogStickDisabled:
//            return 2 * .pi
//        case .analogStickEnabled:
//            return 0
//        }
//    }
//    
//    var buttonColor: Color {
//        Color(red: 0.15, green: 0.15, blue: 0.15)
//    }
//    
//    var upperSquareColor: Color {
//        switch analogStickState {
//        case .analogStickDisabled:
//                .black
//        case .analogStickEnabled:
//            Color(red: 0.3, green: 0.3, blue: 0.3)
//        }
//        
//    }
//    
//    var maskFrame: CGSize {
//        switch analogStickState {
//        case .analogStickEnabled:
//                .init(width: 32, height: 32)
//        case .analogStickDisabled:
//                .zero
//        }
//    }
//    
//    var upperSquareRadius: Double {
//        switch analogStickState {
//        case .analogStickDisabled:
//                return 2
//        case .analogStickEnabled:
//                return 11
//        }
//    }
//    
//    
//    var upperSquareSize: CGSize {
//        switch analogStickState {
//        case .analogStickDisabled:
//                .init(width: 12, height: 32)
//        case .analogStickEnabled:
//                .init(width: 22, height: 22)
//        }
//    }
//    
//
//    
//    var downSquareSize: CGSize {
//        switch analogStickState {
//        case .analogStickDisabled:
//                .init(width: 32, height: 12)
//        case .analogStickEnabled:
//                .init(width: 32, height: 32)
//        }
//    }
//    
//    var downSquareRadius: Double {
//        switch analogStickState {
//        case .analogStickDisabled:
//                return 2
//        case .analogStickEnabled:
//                return 16
//        }
//    }
//    
//    var buttonSize: CGSize {
//        return .init(width: 10, height: 10)
//    }
//    
//    var buttonCornerRadius: Double {
//        switch analogStickState {
//        case .analogStickDisabled:
//            return 2
//        case .analogStickEnabled:
//            return 5
//        }
//    }
//    
//    
//    
//}
//
//
//enum AnalogStickState {
//    case analogStickEnabled
//    case analogStickDisabled
//}
//
//enum ControlerSide {
//    case left
//    case right
//}
//
//
//
//struct ControllerConfiguration: ControllerAppearanceState {
//    
//    var analogStickState: AnalogStickState
//    var side: ControlerSide
//    var numberOfButtons: Int
//    
//    
//    init(analogStickState: AnalogStickState, side: ControlerSide, numberOfButtons: Int) {
//        self.analogStickState = analogStickState
//        self.side = side
//        self.numberOfButtons = numberOfButtons
//    }
//    
//}
