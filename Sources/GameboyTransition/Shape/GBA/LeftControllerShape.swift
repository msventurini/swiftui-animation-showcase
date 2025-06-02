//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI
import AnimationFoundation

struct TesteMorphingShape: View {
    
    let leftControllerShape: AnimatableShapeCoordinateMultipliers = .init(
        topLeadingCoordinates: .init(x: 0.32, y: 0.22),
        topTrailingCoordinates: .init(x: 0, y: 0.04),
        bottomTrailingCoordinates: .init(x: 0, y: -0.09),
        bottomLeadingCoordinates: .init(x: 0.5, y: -0.30))
    
    let zeroShape: AnimatableShapeCoordinateMultipliers = .zero
    
    let leftControllerAngles: AnimatableShapeAngleValues = .init(
        topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
        topTrailingAngleValues: .init(startAngle: Angle(degrees: 50), endAngle: Angle(degrees: 50)),
        
        bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
        bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180)))
    
    let zeroAngles: AnimatableShapeAngleValues = .zero
    

    
//    let zeroAngle: AnimatableAngleVariation = .zero
    
    @State var isTapped: Bool = false
    
    var currentShape: AnimatableShapeCoordinateMultipliers {
        isTapped ? leftControllerShape : zeroShape
    }
    
    var currentAngle: AnimatableShapeAngleValues {
        
        isTapped ? leftControllerAngles : zeroAngles
        
    }
    
    
    var body: some View {
        
        VStack {
            GenericShape(animatableCoordinateMultipliers: currentShape, angles: currentAngle)
            
            Button {
                withAnimation {
                    isTapped.toggle()
                }
            } label: {
                Text("aaa")
            }
            
        }
        
        
    }
}

struct GenericShape: Shape {
    
    var animatableCoordinateMultipliers: AnimatableShapeCoordinateMultipliers

    var angles: AnimatableShapeAngleValues

    
//    var animatableData: AnimatableShapeCoordinateMultipliers {
//        get { animatableCoordinateMultipliers }
//        set { animatableCoordinateMultipliers = newValue }
//    }
    
    var animatableData: AnimatablePair<AnimatableShapeCoordinateMultipliers, AnimatableShapeAngleValues> {
        get {
           AnimatablePair(animatableCoordinateMultipliers, angles)
        }

        set {
            animatableCoordinateMultipliers = newValue.first
            angles = newValue.second
        }
    }
    
   
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            
            center: CGPoint(
                x: (rect.minX +
                    (rect.size.width *
                     animatableCoordinateMultipliers.topLeadingMultipliers.x)),
                y: (rect.minY +
                    (rect.size.height *
                     animatableCoordinateMultipliers.topLeadingMultipliers.y))
            ),
            
            radius: rect.size.width * 0.22,
            startAngle: angles.topLeadingAngleValues.startAngle,
            endAngle: angles.topLeadingAngleValues.endAngle,
            clockwise: false)
        
        path.addArc(
            center: CGPoint(
                x: (rect.maxX +
                    (rect.size.width *
                     animatableCoordinateMultipliers.topTrailingMultipliers.x)),
                y: (rect.minY +
                    (rect.size.height * animatableCoordinateMultipliers.topTrailingMultipliers.y))),
            radius: 0,
            startAngle: angles.topTrailingAngleValues.startAngle,
            endAngle: angles.topTrailingAngleValues.endAngle,
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(
                x: (rect.maxX +
                    (rect.size.width * animatableCoordinateMultipliers.bottomTrailingMultipliers.x)),
                y: (rect.maxY +
                    (rect.size.height * animatableCoordinateMultipliers.bottomTrailingMultipliers.y))),
            radius: 0,
            startAngle: angles.bottomTrailingAngleValues.startAngle,
            endAngle: angles.bottomTrailingAngleValues.endAngle,
            clockwise: false
        )
            
        
        path.addArc(
            center: CGPoint(
                x: (rect.minX +
                    (rect.size.width *
                     animatableCoordinateMultipliers.bottomLeadingMultipliers.x)),
                y: (rect.maxY +
                    (rect.size.height *
                     animatableCoordinateMultipliers.bottomLeadingMultipliers.y))),
            radius: rect.size.width * 0.5,
            startAngle: angles.bottomLeadingAngleValues.startAngle,
            endAngle: angles.bottomLeadingAngleValues.endAngle,
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}

struct LeftControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.addArc(
            
            center: CGPoint(
                x: (rect.minX + rect.size.width * 0.32),
                y: (rect.minY + rect.size.height * 0.22)
            ),
            
            radius: rect.size.width * 0.22,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 240),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY + (rect.size.height * 0.04)),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - (rect.size.height * 0.09)),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - (0.30 * rect.size.height)),
            radius: rect.size.width * 0.5,
            startAngle: Angle(degrees: 100),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}

struct RightControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.minY + 3.2),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 9.6, y: rect.minY + 17.6),
            radius: 6.4,
            startAngle: Angle(degrees: 300),
            endAngle: Angle(degrees: 360),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - 25.6),
            radius: 15.2,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 80),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.maxY - 7.2),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 80),
            clockwise: false
        )
        
        
        
        
        
        
        path.closeSubpath()
        return path
    }
}

struct ScreenLeftBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.minX + 6.4, y: 8.8),
            radius: 8.8,
            startAngle: Angle(degrees: 220),
            endAngle: Angle(degrees: 270),
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 6.4, y: 8.8),
            radius: 8.8,
            startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 320),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 28.8, y: rect.maxY - 64),
            radius: 64,
            startAngle: Angle(degrees: 60),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX + 28.8, y: rect.maxY - 64),
            radius: 64,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 120),
            clockwise: false
        )
        
        
        path.closeSubpath()
        return path
    }
    
}

#Preview {
    TesteMorphingShape()
        .frame(width: 29.6 ,height: 82)

}

#Preview {

        HStack(spacing: 0) {
            LeftControllerShape()
                .fill(.indigo)
                .frame(width: 29.6)
                .onGeometryChange(for: CGSize.self) { geometry in
                    return geometry.size
                } action: { newValue in
                    print("left: \(newValue.width)x\(newValue.height)")
                }
            ScreenLeftBodyShape()
                .fill(.indigo)
                .frame(width: 88.8)
                .onGeometryChange(for: CGSize.self) { geometry in
                    return geometry.size
                } action: { newValue in
                    print("screen: \(newValue.width)x\(newValue.height)")
                }
    
            RightControllerShape()
                .fill(.indigo)
                .frame(width: 29.6)
                .onGeometryChange(for: CGSize.self) { geometry in
                    return geometry.size
                } action: { newValue in
                    print("right: \(newValue.width)x\(newValue.height)")
                }
    
        }
        .frame(height: 82)
        .background(.red)
        .onGeometryChange(for: CGSize.self) { geometry in
            return geometry.size
        } action: { newValue in
            print("total: \(newValue.width)x\(newValue.height)")
        }
    
    
    
}


//
//struct GenericShape: Shape {
//    
//    var fourArcShapeCoordinates: AnimatableShapeCoordinateMultipliers
//    
//    
//    
//    var animatableData: AnimatableShapeCoordinateMultipliers {
//        get { fourArcShapeCoordinates }
//        set { fourArcShapeCoordinates = newValue }
//    }
//    
//   
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        path.addArc(
//            
//            center: CGPoint(
//                x: (rect.minX +
//                    (rect.size.width *
//                     leftControllerShape.topLeadingMultipliers.x)),
//                y: (rect.minY +
//                    (rect.size.height *
//                    leftControllerShape.topLeadingMultipliers.y))
//            ),
//            
//            radius: rect.size.width * 0.22,
//            startAngle: Angle(degrees: 180),
//            endAngle: Angle(degrees: 240),
//            clockwise: false)
//        
//        path.addArc(
//            center: CGPoint(
//                x: (rect.maxX +
//                    (rect.size.width *
//                     leftControllerShape.topTrailingMultipliers.x)),
//                y: (rect.minY +
//                    (rect.size.height * leftControllerShape.topTrailingMultipliers.y))),
//            radius: 0,
//            startAngle: Angle(degrees: 50),
//            endAngle: Angle(degrees: 50),
//            clockwise: false)
//        
//        
//        path.addArc(
//            center: CGPoint(
//                x: (rect.maxX +
//                    (rect.size.width * leftControllerShape.bottomTrailingMultipliers.x)),
//                y: (rect.maxY +
//                    (rect.size.height * leftControllerShape.bottomTrailingMultipliers.y))),
//            radius: 0,
//            startAngle: Angle(degrees: 0),
//            endAngle: Angle(degrees: 0),
//            clockwise: false
//        )
//            
//        
//        path.addArc(
//            center: CGPoint(
//                x: (rect.minX +
//                    (rect.size.width *
//                     leftControllerShape.bottomLeadingMultipliers.x)),
//                y: (rect.maxY +
//                    (rect.size.height *
//                     leftControllerShape.bottomLeadingMultipliers.y))),
//            radius: rect.size.width * 0.5,
//            startAngle: Angle(degrees: 100),
//            endAngle: Angle(degrees: 180),
//            clockwise: false
//        )
//        
//        path.closeSubpath()
//        return path
//    }
//}
