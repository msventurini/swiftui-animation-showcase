//
//  Extension.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI
import AnimationFoundation

extension ContainerValues {
    @Entry var sectionIdentifier: String = ""
}

extension ContainerValues {
    @Entry var frameWidth: Double? = nil
}

extension ContainerValues {
    @Entry var centerDistanceX: Double? = nil
}

extension ContainerValues {
    @Entry var centerDistanceY: Double? = nil
}

extension ContainerValues {
    @Entry var orderOnList: Int = 0
}

extension View {
    func order(_ orderOnList: Int = 0) -> some View {
        containerValue(\.orderOnList, orderOnList)
    }
}
