//
//  AnimatablePointCollection.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 05/06/25.
//

import SwiftUI

struct AnimatablePointCollection {
    var points: [CGPoint]
}


extension AnimatablePointCollection: AdditiveArithmetic {
    static func - (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
        let sub = zip(lhs.points, rhs.points)
        .map { (lhsPoint, rhsPoint) in
            CGPoint(
                x: lhsPoint.x - rhsPoint.x,
                y: lhsPoint.y - rhsPoint.y)
        }
        return AnimatablePointCollection(points: sub)
    }
    
    static func + (lhs: AnimatablePointCollection, rhs: AnimatablePointCollection) -> AnimatablePointCollection {
        
        let sum = zip(
            lhs.points, rhs.points
        )
        .map { (lhsPoint, rhsPoint) in
            CGPoint(
                x: lhsPoint.x + rhsPoint.x,
                y: lhsPoint.y + rhsPoint.y)
        }
        return AnimatablePointCollection(points: sum)
        
    }
    
    static var zero: AnimatablePointCollection {
        return AnimatablePointCollection(points: [])
    }
    
    
}

extension AnimatablePointCollection: VectorArithmetic {
    mutating func scale(by rhs: Double) {
        self.points = self.points.map { point in
            CGPoint(x: rhs * point.x ,
                    y: rhs * point.y)
        }
    }
    
    var magnitudeSquared: Double {
        self.points.reduce(0) { partialResult, point in
            partialResult + point.animatableData.magnitudeSquared
        }
    }
    
    
}


struct AnimatablePointCollectionDebugView: View {
    
    var positions: AnimatablePointCollection = .init(
        points: [
            .init(x: 0, y: 0),
            .init(x: 200, y: 0),
            .init(x: 200, y: 200),
            .init(x: 0, y: 200)
        ]
    )
    
    var positions2: AnimatablePointCollection = .init(
        points: [
            .init(x: 80, y: 120),
            .init(x: 400, y: 0),
            .init(x: 150, y: 400),
            .init(x: 300, y: 300)
        ]
    )
    
    @State var isTapped: Bool = false
    
    var body: some View {
        
        ZStack {
            AnimatablePointCollectionDebugShape(positions: isTapped ? positions : positions2)
            Button {
                withAnimation {
                    isTapped.toggle()
                }
            } label: {
                Text("toggle")
            }
        }
        
        
    }
}

struct AnimatablePointCollectionDebugShape: Shape {
    
    var positions: AnimatablePointCollection
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard let origin = positions.points.first else {
            return path
        }
        
        path.move(to: origin)
        positions.points.forEach { point in
            path.addLine(to: point)
        }
        
        
        return path
    }
    
}

extension AnimatablePointCollectionDebugShape: Animatable {
    var animatableData: AnimatablePointCollection {
        
        get {
            positions
        }
        
        set {
            positions = newValue
        }
    }
    
}



#Preview {
    AnimatablePointCollectionDebugView()
}
