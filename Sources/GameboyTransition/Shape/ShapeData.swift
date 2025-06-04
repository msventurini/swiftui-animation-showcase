//
//  ShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct ShapeData: ShapeSectionProvider, Identifiable, Hashable {
    
    var id: SectionedShape
    
    let leftScreenShapeData: AnimatableShapeModel
    let rightScreenShapeData: AnimatableShapeModel
    let leftControllerShapeData: AnimatableShapeModel
    let rightControllerShapeData: AnimatableShapeModel
    
    init(id: SectionedShape ,leftScreenShapeData: AnimatableShapeModel, rightScreenShapeData: AnimatableShapeModel, leftControllerShapeData: AnimatableShapeModel, rightControllerShapeData: AnimatableShapeModel) {
        self.id = id
        self.leftScreenShapeData = leftScreenShapeData
        self.rightScreenShapeData = rightScreenShapeData
        self.leftControllerShapeData = leftControllerShapeData
        self.rightControllerShapeData = rightControllerShapeData
    }
    
    init<D: ShapeSectionProvider>(shapeProvider: D) {
        self.id = shapeProvider.id
        self.leftScreenShapeData = shapeProvider.leftScreenShapeData
        self.rightScreenShapeData = shapeProvider.rightScreenShapeData
        self.leftControllerShapeData = shapeProvider.leftControllerShapeData
        self.rightControllerShapeData = shapeProvider.rightControllerShapeData
    }
    
    
    
}

enum SectionedShape: Int, Identifiable, CaseIterable, Hashable, Equatable, CustomStringConvertible {
    
    var id: Int {
        return self.rawValue
    }
    
    case gb = 0
    case gbc
    case gba
    case nsw
    
    static let gbShape = ShapeData(shapeProvider: GBShapeData())
    static let gbcShape = ShapeData(shapeProvider: GBCShapeData())
    static let gbaShape = ShapeData(shapeProvider: GBAShapeData())
    static let nswShape = ShapeData(shapeProvider: NSWShapeData())
    
    
    var description: String {
        switch self {
        case .gb: "gb"
        case .gbc: "gbc"
        case .gba: "gba"
        case .nsw: "nsw"
        }
    }
    
//    var shapeData: some ShapeSectionProvider {
    var shapeData: ShapeData {
        switch self {
        case .gb: SectionedShape.gbShape
        case .gbc: SectionedShape.gbcShape
        case .gba: SectionedShape.gbaShape
        case .nsw: SectionedShape.nswShape
        }
    }
    
    static func allSectionedShapes() -> [ShapeData] {
        SectionedShape
            .allCases
            .map { shape in
                switch shape {
                case .gb:
                    gbShape
                case .gbc:
                    gbcShape
                case .gba:
                    gbaShape
                case .nsw:
                    nswShape
                }
            }
    }
    
    static func defaultSelection() -> ShapeData {
        gbShape
    }
    
}
