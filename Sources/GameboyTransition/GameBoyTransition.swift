//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct GameBoyTransition: View {
    var body: some View {
        ContainerSelectionView()
            .modelContainer(AppDataUtils.container)
    }
}
