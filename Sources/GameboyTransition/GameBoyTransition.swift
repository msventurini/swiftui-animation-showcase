//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation

struct GameBoyTransition: View {
    @Environment(\.containerCollection) private var containerCollection

//    @State var containerCollection: ContainerCollection = .init()
    
    init() {
        
    }
    
    var body: some View {
//        ContainerSelectionView(selected: containerCollection.consoleCollection.first)
        ContainerSelectionView(selected: containerCollection.first!)
//            .environment(containerCollection)
//            .modelContainer(AppDataUtils.container)
        
    }
}
//
//#Preview(traits: .modifier(ContainerPreviewModifier())) {
//    GameBoyTransition()
//}
