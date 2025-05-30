//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData
import AnimationFoundation

@Model public class ConsoleSection {

    public var drawingOrderNumber: Int
    public var sectionName: String
    public var sizeProportion: Double
    public var console: Container?
    public var sliceOriginPosition: CGRectEdge { return codableSliceOriginPosition.asCGRectEdge }
    public var color: Color { return animatableColor.asSwiftUIColor() }
    
    private var animatableColor: AnimatableColor
    private var codableSliceOriginPosition: CodableRectEdge
    
    init(
        orderNumber drawingOrderNumber: Int,
        sectionName sectionName: String,
        color animatableColor: AnimatableColor,
        originPosition: CodableRectEdge,
        sizeProportion: Double
    ) {
        self.drawingOrderNumber = drawingOrderNumber
        self.sectionName = sectionName
        self.animatableColor = animatableColor
        self.codableSliceOriginPosition = originPosition
        self.sizeProportion = sizeProportion
    }
}

