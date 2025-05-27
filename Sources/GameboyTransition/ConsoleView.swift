//
//  ConsoleView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI

struct SectionsGrid: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        return proposal.replacingUnspecifiedDimensions()
        
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let containerSize: CGSize = bounds.size
        let (slice, remainder) = bounds.divided(atDistance: bounds.height * 0.5, from: .minYEdge)
        
        for (_, subview) in subviews.enumerated() {
            
            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            
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
                        .fill(styleData.color)
                        .containerValue(\.sizeProportion, styleData.sizeProportion)
                        .containerValue(\.originPosition, styleData.originPosition)
                        .onAppear {
                            print(section.id)
                        }
                }
            }
            .background(.red)
            .aspectRatio(90/148, contentMode: .fit)
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

