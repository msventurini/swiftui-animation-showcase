////
////  ShapeDataProvider.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 04/06/25.
////
//
//import SwiftUI
//import AnimationFoundation
//
//protocol ShapeSectionProvider {
//    
//    var leftScreenShapeData: AnimatableShapeModel { get }
//    var rightScreenShapeData: AnimatableShapeModel { get }
//    var leftControllerShapeData: AnimatableShapeModel { get }
//    var rightControllerShapeData: AnimatableShapeModel { get }
//    
//}
//
//extension ShapeSectionProvider {
//    
//    func shapeModel(for section: ShapeSection) -> AnimatableShapeModel {
//        switch section {
//        case .leftScreen:
//            leftScreenShapeData
//        case .rightScreen:
//            rightScreenShapeData
//        case .leftController:
//            leftControllerShapeData
//        case .rightController:
//            rightControllerShapeData
//        }
//    }
//    
//    func allSectionModels() -> [AnimatableShapeModel] {
//        SectionedShape
//            .allCases
//            .map({ shapeModel(for: $0) })
//        
//        
//        
//    }
//    
//}
//
