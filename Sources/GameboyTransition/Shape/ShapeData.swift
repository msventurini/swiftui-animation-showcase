//
//  ShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct ShapeData: ShapeSectionProvider, Identifiable, Hashable {
    
    
    
    let id: SectionedShapeLegacy
    
    let leftScreenShapeData: AnimatableShapeModel
    let rightScreenShapeData: AnimatableShapeModel
    let leftControllerShapeData: AnimatableShapeModel
    let rightControllerShapeData: AnimatableShapeModel
    
    let width: CGFloat
    
    let height: CGFloat
    
    init(id: SectionedShapeLegacy ,leftScreenShapeData: AnimatableShapeModel, rightScreenShapeData: AnimatableShapeModel, leftControllerShapeData: AnimatableShapeModel, rightControllerShapeData: AnimatableShapeModel, width: CGFloat, height: CGFloat) {
        self.id = id
        self.leftScreenShapeData = leftScreenShapeData
        self.rightScreenShapeData = rightScreenShapeData
        self.leftControllerShapeData = leftControllerShapeData
        self.rightControllerShapeData = rightControllerShapeData
        self.width = width
        self.height = height
    }
    
    init<D: ShapeSectionProvider>(shapeProvider: D) {
        self.id = shapeProvider.id
        self.leftScreenShapeData = shapeProvider.leftScreenShapeData
        self.rightScreenShapeData = shapeProvider.rightScreenShapeData
        self.leftControllerShapeData = shapeProvider.leftControllerShapeData
        self.rightControllerShapeData = shapeProvider.rightControllerShapeData
        self.width = shapeProvider.width
        self.height = shapeProvider.height
    }
    
    init(shapeEnum: SectionedShapeLegacy) {
        let shape = shapeEnum.shapeData
        self.id = shape.id
        self.leftScreenShapeData = shape.leftScreenShapeData
        self.rightScreenShapeData = shape.rightScreenShapeData
        self.leftControllerShapeData = shape.leftControllerShapeData
        self.rightControllerShapeData = shape.rightControllerShapeData
        self.width = shape.width
        self.height = shape.height
        
    }
    
}
