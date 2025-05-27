//
//  ConsoleView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI

struct SectionsGrid: Layout {
    
//    let contentAspectRatio: CGSize?
    @Binding var contentAspectRatioWidth: Double
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
//        guard
////            let contentAspectRatioWidth,
//            let proposalWidth = proposal.width,
//            let proposalHeight = proposal.height
//        else {
//            let size = proposal.replacingUnspecifiedDimensions()
//
//            print(size)
//            
//            return size
//        }
//        print(ProposedViewSize.infinity)
//        let width = pro * contentAspectRatioWidth
        let width = /*proposalWidth **/ contentAspectRatioWidth
        let height = contentAspectRatioWidth// * contentAspectRatio.height
        let size = CGSize(width: width, height: height)
        //        let size = proposal.replacingUnspecifiedDimensions()
//        print(size)
//        return proposal.replacingUnspecifiedDimensions(by: size)
        return size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
 
        
//        for (index, subview) in subviews.enumerated() {
        for (_, subview) in subviews.enumerated() {
            
            let point: CGPoint = bounds.origin
            
            let size = subview.sizeThatFits(ProposedViewSize(bounds.size))
            print(size)
            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .init(size))
        }
        
        
    }
    
    
}


struct ConsoleView: View {
    
    var console: HandheldGameConsole
    @Binding var widthData: Double
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            SectionsGrid(contentAspectRatioWidth: $widthData) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            //            Text("a")
            //            ForEach(ConsoleSection.allCases) { section in
            //
            //                let styleData = console.styleDataFor(component: section)
            //
            //                Section {
            //
            //                    Rectangle()
            //                        .fill(styleData.color)
            //                        .frame(
            //                            width: styleData.size.width,
            //                            height: styleData.size.height
            //                        )
            //                        .overlay {
            //                            Text(section.description)
            //                        }
            //
            //
            //                }
            //            }
        }
        
        
        
    }
    
}

#Preview {
    
//    @Previewable @State var console: HandheldGameConsole = .gameboyDMG
    @Previewable @State var console: HandheldGameConsole = .gameboyDMG
    @Previewable @State var widthSize: Double = 0
    
    
    VStack {
        ConsoleView(console: console, widthData: $widthSize)
        HStack {
            Slider(value: $widthSize, in: 0...100)

//            Slider(value: $widthSize, in: ClosedRange<BinaryFloatingPoint>)
//            ForEach(HandheldGameConsole.allCases) { innerConsole in
//                Button {
//                    withAnimation {
//                        console = .advance
//                    }
//                } label: {
//                    Text(innerConsole.description)
//                }
//                
//            }
        }
        
        
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    
    
}

