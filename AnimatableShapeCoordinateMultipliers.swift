//
//  AnimatableShapeCoordinateMultipliers.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//


import SwiftUI

public struct AnimatableShapeCoordinateMultipliers: Sendable {
    
    public var topLeadingCoordinates: AnimatablePosition
    public var topTrailingCoordinates: AnimatablePosition
    public var bottomTrailingCoordinates: AnimatablePosition
    public var bottomLeadingCoordinates: AnimatablePosition
    
    
    public init(topLeadingCoordinates: AnimatablePosition, topTrailingCoordinates: AnimatablePosition, bottomTrailingCoordinates: AnimatablePosition, bottomLeadingCoordinates: AnimatablePosition) {
        self.topLeadingCoordinates = topLeadingCoordinates
        self.topTrailingCoordinates = topTrailingCoordinates
        self.bottomTrailingCoordinates = bottomTrailingCoordinates
        self.bottomLeadingCoordinates = bottomLeadingCoordinates
    }
    
}