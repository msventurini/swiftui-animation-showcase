//
//  ConsoleFrameLayoutDebugView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData
import SwiftUIComponentKit

struct ConsoleFrameLayoutDebugView: View {
    
    let console: AppDataUtils.ContainerProvider
    
    @State private var viewWidth: Double = 0.0
    @State private var viewHeight: Double = 0.0
    
    var body: some View {
        ConsoleFrameLayout {
            Rectangle()
                .containerValue(\.frameWidth, console.width)
                .containerValue(\.frameHeight, console.height)
                
        }
        .background {
            Rectangle()
                .fill(.secondary)
                .overlay(alignment: .bottomTrailing) {
                    Text("Width: \(Int(viewWidth)) x Height: \(Int(viewHeight)) ")
                }
        }
        .onGeometryChange(for: CGSize.self) { geometry in
            return geometry.size
        } action: { newValue in
            viewWidth = newValue.width
            viewHeight = newValue.height
        }
    }
}