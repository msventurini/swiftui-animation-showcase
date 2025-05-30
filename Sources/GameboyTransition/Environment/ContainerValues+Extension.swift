//
//  Extension.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI
import AnimationFoundation



//extension ContainerValues {
//    @Entry var rectSliceStartingPosition: CGRectEdge = .minXEdge
//}
//
//extension ContainerValues {
//    @Entry var rectSliceProportion: Double = 0
//}
//
//extension ContainerValues {
//    @Entry var sliceOrientation: SliceOrientation = .horizontal
//}

extension ContainerValues {
    @Entry var sectionIdentifier: String = ""
}

extension ContainerValues {
    @Entry var frameWidth: Double? = nil
}

extension ContainerValues {
    @Entry var frameHeight: Double? = nil
}

extension ContainerValues {
    @Entry var relativeOriginX: Double? = nil
}

extension ContainerValues {
    @Entry var relativeOriginY: Double? = nil
}

extension ContainerValues {
    @Entry var consoleSectionData: ConsoleSection? = nil
}

extension ContainerValues {
    @Entry var horizontalProportionToContainer: Double? = nil
}

extension ContainerValues {
    @Entry var verticalProportionToContainer: Double? = nil
}

extension ContainerValues {
    @Entry var drawingOrder: Int = 1000
}


