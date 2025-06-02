//
//  FourArcShapeCoordinates.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeCoordinateMultipliers: Sendable {
    
    public var topLeadingMultipliers: AnimatablePosition
    public var topTrailingMultipliers: AnimatablePosition
    public var bottomTrailingMultipliers: AnimatablePosition
    public var bottomLeadingMultipliers: AnimatablePosition
    
    
    public init(topLeadingCoordinates: AnimatablePosition, topTrailingCoordinates: AnimatablePosition, bottomTrailingCoordinates: AnimatablePosition, bottomLeadingCoordinates: AnimatablePosition) {
        self.topLeadingMultipliers = topLeadingCoordinates
        self.topTrailingMultipliers = topTrailingCoordinates
        self.bottomTrailingMultipliers = bottomTrailingCoordinates
        self.bottomLeadingMultipliers = bottomLeadingCoordinates
    }
    
}

extension AnimatableShapeCoordinateMultipliers: AdditiveArithmetic {
    public static func - (lhs: AnimatableShapeCoordinateMultipliers, rhs: AnimatableShapeCoordinateMultipliers) -> AnimatableShapeCoordinateMultipliers {
        return .init(
            topLeadingCoordinates: lhs.topLeadingMultipliers - rhs.topLeadingMultipliers,
            topTrailingCoordinates: lhs.topTrailingMultipliers - rhs.topTrailingMultipliers,
            bottomTrailingCoordinates: lhs.bottomTrailingMultipliers - rhs.bottomTrailingMultipliers, bottomLeadingCoordinates: lhs.bottomLeadingMultipliers - rhs.bottomLeadingMultipliers
        )
    }
    
    public static func + (lhs: AnimatableShapeCoordinateMultipliers, rhs: AnimatableShapeCoordinateMultipliers) -> AnimatableShapeCoordinateMultipliers {
        return .init(
            topLeadingCoordinates: lhs.topLeadingMultipliers + rhs.topLeadingMultipliers,
            topTrailingCoordinates: lhs.topTrailingMultipliers + rhs.topTrailingMultipliers,
            bottomTrailingCoordinates: lhs.bottomTrailingMultipliers + rhs.bottomTrailingMultipliers, bottomLeadingCoordinates: lhs.bottomLeadingMultipliers + rhs.bottomLeadingMultipliers
        )
    }
    
    public static var zero: AnimatableShapeCoordinateMultipliers {
        return .init(
            topLeadingCoordinates: .zero,
            topTrailingCoordinates: .zero,
            bottomTrailingCoordinates: .zero, bottomLeadingCoordinates: .zero
        )
    }
}

extension AnimatableShapeCoordinateMultipliers: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self.topLeadingMultipliers = self.topLeadingMultipliers.scaled(by: rhs)
        self.topTrailingMultipliers = self.topTrailingMultipliers.scaled(by: rhs)
        self.bottomTrailingMultipliers = self.bottomTrailingMultipliers.scaled(by: rhs)
        self.bottomLeadingMultipliers = self.bottomLeadingMultipliers.scaled(by: rhs)
        
    }
    
    public var magnitudeSquared: Double {
        
        return self.topLeadingMultipliers.magnitudeSquared
        
        
    }
    
    
}

struct TesteShape: Shape, Animatable {
    
    var fourArcShapeCoordinates: AnimatableShapeCoordinateMultipliers
    
    
    
    var animatableData: AnimatableShapeCoordinateMultipliers {
        get { fourArcShapeCoordinates }
        set { fourArcShapeCoordinates = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + fourArcShapeCoordinates.topLeadingMultipliers.x, y: rect.minY + fourArcShapeCoordinates.topLeadingMultipliers.y))
        path.addLine(to:  CGPoint(x: rect.maxX - fourArcShapeCoordinates.topTrailingMultipliers.x, y: fourArcShapeCoordinates.topTrailingMultipliers.y))
        path.addLine(to: fourArcShapeCoordinates.bottomTrailingMultipliers.cgPoint)
        path.addLine(to:  fourArcShapeCoordinates.bottomLeadingMultipliers.cgPoint)
        path.addLine(to:  fourArcShapeCoordinates.topLeadingMultipliers.cgPoint)
        
        return path
        
    }
    
    
}

struct TestingShapeAnimation: View {
    
    @State var isTapped = false
    
    var coordinates: AnimatableShapeCoordinateMultipliers {
        isTapped ? .init(topLeadingCoordinates: .init(x: 10, y: 10), topTrailingCoordinates: .init(x: 40, y: 5), bottomTrailingCoordinates: .init(x: 30, y: 120), bottomLeadingCoordinates: .init(x: 60, y: 90)) : .zero
    }
    
    var body: some View {
        
        VStack {
            TesteShape(fourArcShapeCoordinates: coordinates)
                .frame(width: 200, height: 200)
            Button {
                withAnimation {
                    isTapped.toggle()
                }
                print(coordinates)
            } label: {
                Text("aaa")
            }
        }
        
    }
}


#Preview {
    TestingShapeAnimation()
}
