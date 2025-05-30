//
//  ContainerPreviewData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerPreviewModifier: PreviewModifier {

    static func makeSharedContext() async throws -> ContainerCollection {
        let containerCollection: ContainerCollection = .init()
        return containerCollection
    }

    func body(content: Content, context: ContainerCollection) -> some View {
        content
            .environment(context)
    }
}
