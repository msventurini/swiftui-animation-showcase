//
//  ShapeDataProvider.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

protocol ShapeSectionProvider: Identifiable {
    
    var id: SectionedShapeLegacy { get }
    
    var leftScreenShapeData: AnimatableShapeModel { get }
    var rightScreenShapeData: AnimatableShapeModel { get }
    var leftControllerShapeData: AnimatableShapeModel { get }
    var rightControllerShapeData: AnimatableShapeModel { get }
    

    
    
    var allSections: [AnimatableShapeModel] { get }
    
}



//
//init(id: Int, originX: Double, originY: Double, widthRatioToContainer: Double, heightRatioToContainer: Double, containerWidth: Double, containerHeight: Double) {
//    
//    self.id = id
//    
//    self.widthRatioToContainer = widthRatioToContainer
//    self.heightRatioToContainer = heightRatioToContainer
//    
//    self.containerWidth = containerWidth
//    self.containerHeight = containerWidth
//    self.width = containerWidth * widthRatioToContainer
//    self.height = containerHeight * heightRatioToContainer
//    
//    let centerX = (originX + (widthRatioToContainer * 0.5)) - 0.5
//    let centerY = (originY + (heightRatioToContainer * 0.5)) - 0.5
//    self.centerPointX = centerX
//    self.centerPointY = centerY
//    
//    self.centerDistanceX = centerX * containerWidth
//    self.centerDistanceY = centerY * containerHeight
//    
//}



extension ShapeSectionProvider {
    
    var allSections: [AnimatableShapeModel] {
        return [
            leftScreenShapeData,
            rightScreenShapeData,
            leftControllerShapeData,
            rightControllerShapeData
        ]
    }
    
    func shapeModel(for section: ShapeSection) -> AnimatableShapeModel {
        switch section {
        case .leftScreen:
            leftScreenShapeData
        case .rightScreen:
            rightScreenShapeData
        case .leftController:
            leftControllerShapeData
        case .rightController:
            rightControllerShapeData
        }
    }
    
    
    
//    func allSectionModels() -> [AnimatableShapeModel] {
//        ShapeSection
//            .allCases
//            .map({ shapeModel(for: $0) })
        
        
        
//    }
    
}

