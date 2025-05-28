//
//  Screen.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct ContainerSection: ComponentStyleData {
    
    typealias DataGroupContainer = HandheldConsoleContainer
    
    public var sliceOriginPosition: CGRectEdge
    public let sizeProportion: Double
    public let color: Color

    init(sliceOriginPosition: CGRectEdge, sizeProportion: Double, color: Color) {
        self.sliceOriginPosition = sliceOriginPosition
        self.sizeProportion = sizeProportion
        self.color = color
    }
}
