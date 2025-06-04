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
    
    @State var selected: ShapeData
    
    var body: some View {
        
        VStack {
            ContainerView(selected: $selected)
            
            ForEach(SectionedShape.allCases) { consoleItem in
//
                Button {
                    withAnimation {
                        selected = consoleItem.shapeData
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
