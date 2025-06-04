//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftUIComponentKit
import AnimationFoundation

struct ContainerSelectionView: View {
    
    @Environment(\.sectionedShapeCollection) private var shapeCollection
    @Environment(\.selectedShape) private var selectedShape
    
    @State var selected: SectionedShapeLegacy
    
    var body: some View {
        
        VStack {
            ContainerView()
                .environment(\.selectedShape, selected)
            
            ForEach(SectionedShapeLegacy.allCases) { consoleItem in
//
                Button {
                    withAnimation {
                        selected = consoleItem
                    }
                    
                } label: {
                    Text(consoleItem.description)
                }
//                
            }
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
