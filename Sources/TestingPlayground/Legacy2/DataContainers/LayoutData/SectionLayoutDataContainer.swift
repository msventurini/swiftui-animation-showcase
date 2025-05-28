//
//  Screen.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct SectionLayoutDataContainer: Sendable, Equatable, Hashable {
        
    public var sliceOriginPosition: CGRectEdge
    public let sizeProportion: Double

    init(sliceOriginPosition: CGRectEdge, sizeProportion: Double) {
        self.sliceOriginPosition = sliceOriginPosition
        self.sizeProportion = sizeProportion
    }
}


