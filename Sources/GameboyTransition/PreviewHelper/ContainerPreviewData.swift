//
//  ContainerPreviewData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerPreviewData: PreviewModifier {

    static func makeSharedContext() async throws -> ModelContainer {
        let modelContainer = AppDataUtils.container
        return modelContainer
        
    }

    func body(content: Content, context: ModelContainer) -> some View {
        content
//            .modelContainer(context.container.self)
            .modelContainer(context)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
