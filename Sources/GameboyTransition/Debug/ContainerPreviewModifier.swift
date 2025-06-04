//
//  ContainerPreviewData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerPreviewModifier: PreviewModifier {

    static func makeSharedContext() async throws -> [ShapeData] {
//        let containerCollection: [Container] = AppDataUtils.getContainerCollection()
        let containerCollection: [ShapeData] = SectionedShape.allSectionedShapes()
        return containerCollection
    }

    func body(content: Content, context: [ShapeData]) -> some View {
        content
            .environment(\.sectionedShapeCollection, context)
    }
}
