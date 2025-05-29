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

    private let sectionID: SectionID    
    private let styleData: SectionStyleDataContainer
    private let layoutData: SectionLayoutDataContainer
    
    init(sectionID: SectionID, styleData: SectionStyleDataContainer, layoutData: SectionLayoutDataContainer) {
        self.sectionID = sectionID
        self.styleData = styleData
        self.layoutData = layoutData
    }

    func getViewStyleData(container: AppDataUtils.ContainerProvider) -> SectionStyleDataContainer {
        
        let colorData = ColorData(console: container, consoleSectionIdentifier: sectionID)

        return SectionStyleDataContainer(color: colorData.color)
        
    }
    
    func getLayoutContainerData(container: AppDataUtils.ContainerProvider) -> SectionLayoutDataContainer {
        
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
