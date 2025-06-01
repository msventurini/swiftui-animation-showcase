//
//  ContainerPreviewData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerPreviewModifier: PreviewModifier {

    static func makeSharedContext() async throws -> [Container] {
        let containerCollection: [Container] = AppDataUtils.getContainerCollection()
//        let container = AppDataUtils.container
        return containerCollection
    }

    func body(content: Content, context: [Container]) -> some View {
        content
            .environment(\.containerCollection, context)
//            .modelContext(context.mainContext)
    }
}
