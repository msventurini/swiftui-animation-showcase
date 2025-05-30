//
//  ContainerPreviewData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerPreviewModifier: PreviewModifier {

    static func makeSharedContext() async throws -> ModelContainer {
//        let containerCollection: ContainerCollection = .init()
        let container = AppDataUtils.container
        return container
    }

    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContext(context.mainContext)
    }
}
