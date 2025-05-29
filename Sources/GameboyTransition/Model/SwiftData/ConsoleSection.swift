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

@Model class ConsoleSection {

    var drawingOrderNumber: Int

    var sectionID: SectionIdentifier

    private var animatableColor: AnimatableColor

    var sizeProportion: Double
    
    private var codableSliceOriginPosition: CodableRectEdge
    
    var console: Console?
    
    var sliceOriginPosition: CGRectEdge {
        return codableSliceOriginPosition.asCGRectEdge
    }
    
    var color: Color {
        return animatableColor.asSwiftUIColor()
    }
    
    init(
        orderNumber drawingOrderNumber: Int,
        section sectionID: SectionIdentifier,
        color animatableColor: AnimatableColor,
        originPosition: CodableRectEdge,
        sizeProportion: Double
    ) {
        self.drawingOrderNumber = drawingOrderNumber
        self.sectionID = sectionID
        self.animatableColor = animatableColor
        self.codableSliceOriginPosition = originPosition
        self.sizeProportion = sizeProportion
    }
}

