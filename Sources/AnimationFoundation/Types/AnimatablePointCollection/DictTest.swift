////
////  DictTest.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 05/06/25.
////
//
////
////  AnimatablePointCollection.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 05/06/25.
////
//
//import SwiftUI
//
//struct AnimatablePointCollection {
//    var pointsDictionary: [Int:CGPoint]
//}
//
//
//extension AnimatablePointCollection: AdditiveArithmetic {
//    static func - (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
//        
//        let newDictionary = lhs.pointsDictionary.merging(rhs.pointsDictionary) { current, new in
//            
//            CGPoint(
//                x: current.x - new.x,
//                y: current.y - new.y)
//            
//        }
//        
//        return AnimatablePointCollection(pointsDictionary: newDictionary)
//        
//    }
//    
//    static func + (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
//        
//        let newDictionary = lhs.pointsDictionary.merging(rhs.pointsDictionary) { current, new in
//            
//            CGPoint(
//                x: current.x + new.x,
//                y: current.y + new.y)
//            
//        }
//        
//        
//        
//        return AnimatablePointCollection(pointsDictionary: newDictionary)
//        
//    }
//    
//    static var zero: AnimatablePointCollection {
//        return AnimatablePointCollection(pointsDictionary: [:])
//    }
//    
//    
//}
//
//extension AnimatablePointCollection: VectorArithmetic {
//    mutating func scale(by rhs: Double) {
//        self.pointsDictionary.forEach { (key: Int, value: CGPoint) in
//            let point = CGPoint(x: rhs * value.x ,
//                    y: rhs * value.y)
//            
//            self.pointsDictionary.updateValue(point, forKey: key)
//            
//        }
//        
//        //
//    }
//    
//    var magnitudeSquared: Double {
//        self.pointsDictionary.reduce(0) { partialResult, point in
//            partialResult + point.value.animatableData.magnitudeSquared
//        }
//    }
//    
//    
//}
//
//
//struct AnimatablePointCollectionDebugView: View {
//    
//    var positions: AnimatablePointCollection = .init(
//        pointsDictionary: [
//            0 : .init(x: 0, y: 0),
//            1 : .init(x: 200, y: 0),
//            2 : .init(x: 200, y: 200),
//            3 : .init(x: 0, y: 200)
//        ]
//    )
//    
//    var positions2: AnimatablePointCollection = .init(
//        pointsDictionary: [
//            0 : .init(x: 80, y: 120),
//            1 : .init(x: 400, y: 0),
//            2 : .init(x: 150, y: 400),
//            3 : .init(x: 300, y: 300)
//        ]
//    )
//    
//    @State var isTapped: Bool = false
//    
//    var body: some View {
//        
//        ZStack {
//            AnimatablePointCollectionDebugShape(positions: isTapped ? positions : positions2)
//            Button {
//                withAnimation {
//                    isTapped.toggle()
//                }
//            } label: {
//                Text("toggle")
//            }
//        }
//        
//        
//    }
//}
//
//struct AnimatablePointCollectionDebugShape: Shape {
//    
//    var positions: AnimatablePointCollection
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        guard let origin = positions.pointsDictionary.values.first else {
//            return path
//        }
//        
//        path.move(to: origin)
//        positions.pointsDictionary.values.forEach { point in
//            path.addLine(to: point)
//        }
//        
//        
//        return path
//    }
//    
//}
//
//extension AnimatablePointCollectionDebugShape: Animatable {
//    var animatableData: AnimatablePointCollection {
//        
//        get {
//            positions
//        }
//        
//        set {
//            positions = newValue
//        }
//    }
//    
//}
//
//
//
//#Preview {
//    AnimatablePointCollectionDebugView()
//}
//
////
////extension AnimatablePointCollection: AdditiveArithmetic {
////    static func - (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
////        let sub = zip(lhs.points, rhs.points)
////        .map { (lhsPoint, rhsPoint) in
////            CGPoint(
////                x: lhsPoint.x - rhsPoint.x,
////                y: lhsPoint.y - rhsPoint.y)
////        }
////        return AnimatablePointCollection(points: sub)
////    }
////
////    static func + (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
////
////        let sum = zip(
////            lhs.points, rhs.points
////        )
////        .map { (lhsPoint, rhsPoint) in
////            CGPoint(
////                x: lhsPoint.x + rhsPoint.x,
////                y: lhsPoint.y + rhsPoint.y)
////        }
////        return AnimatablePointCollection(points: sum)
////
////    }
////
////    static var zero: AnimatablePointCollection {
////        return AnimatablePointCollection(points: [])
////    }
////
////
////}
////
////extension AnimatablePointCollection: VectorArithmetic {
////    mutating func scale(by rhs: Double) {
////        self.points = self.points.map { point in
////            CGPoint(x: rhs * point.x ,
////                    y: rhs * point.y)
////        }
////    }
////
////    var magnitudeSquared: Double {
////        self.points.reduce(0) { partialResult, point in
////            partialResult + point.animatableData.magnitudeSquared
////        }
////    }
////
////
////}
