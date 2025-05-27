//
//  Controller.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct ControllerSection: ComponentStyleData {
    typealias DataGroupContainer = HandheldGameConsole
    
    public var originPosition: AnimatablePosition
    public let sizeProportion: AnimatableSize
    public let color: Color

//    public let actionButtonAngle: Double
//    public let actionButtonCount: Int    

    init(originPosition: AnimatablePosition, sizeProportion: AnimatableSize, color: Color) {
        self.originPosition = originPosition
        self.sizeProportion = sizeProportion
        self.color = color
    }
    
    
}
