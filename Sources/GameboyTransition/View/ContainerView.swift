//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI
import Observation

struct ContainerView: View {

    @Environment(\.sectionedShapeCollection) private var shapeCollection
    @Environment(\.selectedShape) private var selectedShape
        
    var body: some View {
        Rectangle()
//            .frame(width: selectedShape.shapeData.width, height: selectedShape.shapeData.height)
//            ConsoleFrameLayout {
//                ForEach(selectedShape.shapeData.allSections) { section in
////                ForEach(selected.sections) { section in
//                    SectionView(sectionModel: section)
//                        .containerValue(\.centerDistanceX, section.la)
//                        .containerValue(\.centerDistanceY, section.centerDistanceY)

//                }
//            }
    }
}





#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
