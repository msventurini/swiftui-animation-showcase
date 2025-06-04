//
//  EnvironmentValues.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI

extension EnvironmentValues {
//    @Entry var containerCollection: [Container] = AppDataUtils.getContainerCollection()
    @Entry var sectionedShapeCollection: [SectionedShapeCollection] = .init()
}

extension EnvironmentValues {
//    @Entry var selectedContainer: Container? = nil
    @Entry var selectedShape: SectionedShapeLegacy = .gb
}
