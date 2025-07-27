//
//  SectionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI
import Observation
import AnimationFoundation

struct SectionView: View {
    
    var sectionModel: AnimatableShapeModel
//    var centerDistanceX: Double
//    var centerDistanceY: Double
    
    init(sectionModel: AnimatableShapeModel) {
        self.sectionModel = sectionModel
//        self.centerDistanceX = section.centerDistanceX
//        self.centerDistanceY = section.centerDistanceY
    }
    
    var body: some View {
        
//        Rectangle()
        
        ArcCornersShape(shapeModel: sectionModel, )
//            .strokeBorder(lineWidth: 4)
//            .overlay {
//                Text(section.id.description)
//            }
            .frame(width: sectionModel.referenceWidth, height: sectionModel.referenceHeight)

            
    }
    
}




#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
