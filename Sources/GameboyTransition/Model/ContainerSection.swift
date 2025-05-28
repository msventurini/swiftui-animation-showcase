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
    
    public var originPosition: AnimatablePosition
    public let sizeProportion: AnimatableSize
    public let color: Color

    init(originPosition: AnimatablePosition, sizeProportion: AnimatableSize, color: Color) {
        self.originPosition = originPosition
        self.sizeProportion = sizeProportion
        self.color = color
    }
}
