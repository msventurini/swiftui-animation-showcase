////
////  ShapeDataProvider.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 04/06/25.
////
//
import SwiftUI
import Observation
import AnimationFoundation

struct SectionedShape: Identifiable, Hashable, Sendable {
    
    var id: Int
    
    var shapeData: ShapeData
    
    var shapeLayout: ShapeLayoutDataLegacy
    
    init(id: Int, shapeData: ShapeData, shapeLayout: ShapeLayoutDataLegacy) {
        self.id = id
        self.shapeData = shapeData
        self.shapeLayout = shapeLayout
    }
}

struct ShapeSectionData: Identifiable, Hashable, Sendable {
    
    var id: Int
    
    var sectionData: AnimatableShapeModel
    
    var sectionLayout: ConsoleSectionLayoutData
    
    init(id: Int, sectionData: AnimatableShapeModel, sectionLayout: ConsoleSectionLayoutData) {
        self.id = id
        self.sectionData = sectionData
        self.sectionLayout = sectionLayout
    }
}


@Observable final class SectionedShapeCollection: Identifiable/*, Sendable*/ {
    let collection: [SectionedShape]
    var currentSelected: SectionedShapeLegacy
    
    init(currentSelected: SectionedShapeLegacy = .gb, collection: [SectionedShape]) {
        self.currentSelected = currentSelected
        self.collection = collection
    }
}



enum SectionedShapeLegacy: Int, Identifiable, CaseIterable, Hashable, Equatable, CustomStringConvertible {
    
    var id: Int {
        return self.rawValue
    }
    
    case gb = 0
    case gbc
    case gba
    case nsw
    
    public static let gbShape = ShapeData(shapeProvider: GBShapeData())
    public static let gbcShape = ShapeData(shapeProvider: GBCShapeData())
    public static let gbaShape = ShapeData(shapeProvider: GBAShapeData())
    public static let nswShape = ShapeData(shapeProvider: NSWShapeData())
    
    
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
        case .gb: SectionedShapeLegacy.gbShape
        case .gbc: SectionedShapeLegacy.gbcShape
        case .gba: SectionedShapeLegacy.gbaShape
        case .nsw: SectionedShapeLegacy.nswShape
        }
    }
    
    
    
    
//    var layoutData: ShapeLayoutDataLegacy {
//        switch self {
//        case .gb: AppDataUtils.ContainerData.gameboyDMG.structure
//        case .gbc: AppDataUtils.ContainerData.gameboyDMG.structure
//        case .gba: AppDataUtils.ContainerData.gameboyAdvance.structure
//        case .nsw: AppDataUtils.ContainerData.gameboyAdvance.structure
//        }
//    }
    
    
//    func allSectionedShapes() -> [SectionedShape] {
//        SectionedShapeLegacy
//            .allCases
//            .map({ SectionedShape(id: $0.id, shapeData: $0.shapeData, shapeLayout: $0.layoutData) })
//    }
    
//    func allSections() -> [ShapeSectionData] {
//        SectionedShapeLegacy
//            .allCases
//            .map({ SectionedShape(id: $0.id, shapeData: $0.shapeData, shapeLayout: $0.layoutData) })
//    }
    
    
    static func defaultSelection() -> ShapeData {
        gbShape
    }
    
}

