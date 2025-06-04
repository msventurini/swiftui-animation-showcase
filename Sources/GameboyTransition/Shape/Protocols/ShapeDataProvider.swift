//
//  ShapeDataProvider.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

protocol ShapeDataProvider {
    
    static var screenShapeData: AnimatableShapeModel { get }
    static var leftControllerShapeData: AnimatableShapeModel { get }
    static var rightControllerShapeData: AnimatableShapeModel { get }
    
}

