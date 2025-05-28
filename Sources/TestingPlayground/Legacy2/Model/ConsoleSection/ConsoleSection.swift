//
//  ConsoleComponent.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation


struct ConsoleSection: Identifiable {
    
    var id: SectionID {
        return sectionID
    }
    
//    static let allCases: [ConsoleSection] = [screenSection, leftControllerSection, rightControllerSection]
    
    
    private let sectionID: SectionID
    
    private let styleData: SectionStyleDataContainer
    private let layoutData: SectionLayoutDataContainer
    
    init(sectionID: SectionID, styleData: SectionStyleDataContainer, layoutData: SectionLayoutDataContainer) {
        self.sectionID = sectionID
        self.styleData = styleData
        self.layoutData = layoutData
    }
    
    
//    static let screenSection = ConsoleSection(sectionID: .consoleScreen)
//    static let leftControllerSection = ConsoleSection(sectionID: .controllerLeft)
//    static let rightControllerSection = ConsoleSection(sectionID: .controllerRight)
    
//    var description: String {
//        switch self {
//        case .screenSection:
//            "ConsoleScreen"
//        case .rightControllerSection:
//            "ControllerRight"
//        case .leftControllerSection:
//            "ControllerLeft"
//        default:
//            "none"
//        }
//    }
    
    func getViewStyleData(container: ContainerDataProvider) -> SectionStyleDataContainer {
        
        let colorData = ColorData(console: container, consoleSectionIdentifier: sectionID)

        return SectionStyleDataContainer(color: colorData.color)
        
    }
    
    func getLayoutContainerData(container: ContainerDataProvider) -> SectionLayoutDataContainer {
        
        let geometryData = SectionGeometryData(console: container, consoleSection: sectionID)
        
        
        return SectionLayoutDataContainer(
            sliceOriginPosition: geometryData.sliceOriginPosition,
            sizeProportion: geometryData.sizeProportion,
        )
    }
    
    
    enum SectionID: Int, Identifiable, Hashable {
        
        var id: Int {
            return rawValue
        }
        
        case consoleScreen = 0
        case controllerRight = 1
        case controllerLeft = 2

    }
    
}

#Preview {
    PreviewView()
}
