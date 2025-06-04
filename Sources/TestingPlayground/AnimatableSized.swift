//
//  AnimatableSize.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI
import Synchronization

//
//enum FrameEnum: UInt8 {
//    case opt1
//    case opt2
//    
//    var frame: AnimatableSize {
//        switch self {
//        case .opt1:
//            return .init(width: 100, height: 200)
//        case .opt2:
//            return .init(width: 250, height: 100)
//        }
//    }
//}


//
//
//struct aaa: View, Animatable {
////    @State var isClicked: Bool = false
//
//    private var _size: AnimatableSize {
//        return sizeEnum.frame
//    }
//    
//    var size: AnimatableSize {
//        _size
//    }
//    
//    @State var sizeEnum: FrameEnum = .opt1
//
//    var animatableData: FrameEnum {
//        get { sizeEnum }
//        set { sizeEnum = newValue }
//    }
//    
////    let opt1: ConsoleFrame = .init(width: 100, height: 200)
////    let opt2: ConsoleFrame = .init(width: 250, height: 100)
////    
////    var sizeEnum: FrameEnum {
////        return isClicked ? .opt1 : .opt2
////    }
//    
//    var body: some View {
//        Rectangle()
//            .frame(width: _size.width, height: _size.height)
//            .animation(.bouncy, value: _size)
////        TesteVector(size: isClicked ? (opt1) : opt2)
//            .onTapGesture {
//                withAnimation {
//                    
//                    if sizeEnum == .opt1 {
//                        sizeEnum = .opt2
//                    } else {
//                        sizeEnum = .opt1
//                    }
//                    
//                }
////
//            }
//    }
//}
//
//#Preview {
//    aaa(sizeEnum: .opt2)
//        .frame(width: 400, height: 400)
//    
//}
