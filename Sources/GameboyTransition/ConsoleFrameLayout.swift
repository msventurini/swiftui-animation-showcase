//
//  ConsoleFrameLayout.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData
import SwiftUIComponentKit

struct ConsoleFrameLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let width = subviews
            .compactMap({ $0.containerValues.frameWidth })
            .reduce(0, +)
        
        let heightArray = subviews
            .compactMap({ $0.containerValues.frameHeight })
            .reduce(0, +)
        
        for (_, subview) in subviews.enumerated() {
            let viewSize = subview.sizeThatFits(.init(width: width, height: heightArray))
            
            subview.place(at: .init(x: bounds.midX, y: bounds.midY), anchor: .center, proposal: .init(viewSize))
        }
    }
}

#Preview {
    
    
    
    ForEach(AppDataUtils.ContainerProvider.allCases) { console in
        
        DebugRectView(console: console)
        
    }
}

struct DebugRectView: View {
    
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





