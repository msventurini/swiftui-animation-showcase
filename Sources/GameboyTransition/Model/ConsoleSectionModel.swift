//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData

@Model class ConsoleSectionModel {

    var drawingOrderNumber: Int
    var sectionID: SectionIdentifier
    
    var styleData: SectionStyleDataContainer
    var layoutData: SectionLayoutDataContainer
    
    init(drawingOrderNumber: Int, sectionID: SectionIdentifier, styleData: SectionStyleDataContainer, layoutData: SectionLayoutDataContainer) {
        self.drawingOrderNumber = drawingOrderNumber
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
    
}



