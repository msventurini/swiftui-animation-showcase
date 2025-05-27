//
//  ConsoleView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI

struct SectionsGrid: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let containerProposedSize = proposal.replacingUnspecifiedDimensions()
        
        return containerProposedSize
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let size = bounds.size

        for (_, subview) in subviews.enumerated() {
            
            let point: CGPoint = .init(x: bounds.minX, y: bounds.minY)

            subview.place(at: point, anchor: .zero, proposal: .init(size))
        }
    }
}

struct ConsoleView: View {
    
    var console: HandheldGameConsole

    var body: some View {
            SectionsGrid {
                ForEach(console.sections) { section in
                    let styleData = section.getStyleData(container: console)
                    
                    Rectangle()
                        .containerValue(\.sizeProportion, styleData.sizeProportion)
                }
            }
            .background(.red)
    }
}

#Preview {
    @Previewable @State var console: HandheldGameConsole = .gameboyDMG
    @Previewable @State var widthSize: Double = 100
    
    VStack {
        ConsoleView(console: console)
        HStack {
            ForEach(HandheldGameConsole.allCases) { innerConsole in
                Button {
                    withAnimation {
                        console = innerConsole
                    }
                } label: {
                    Text(innerConsole.description)
                }
            }
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
}

