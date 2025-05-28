//
//  ConsoleView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI
import Foundation


struct ConsoleView: View {
    
    @Binding var console: HandheldConsoleContainer
    
//    let subSections: [ConsoleSection] = HandheldConsoleContainer.gameboyDMG.sections
    
    var body: some View {
        SectionsGrid {
            
//            ForEach(ConsoleSection.allCases) { section in
                
//                let styleData = section.getLayoutContainerData(container: console)
//                SectionView(section: section)
                Rectangle()

//            }
        }
    }
}

struct SectionView: View {
    
    @Environment(\.currentContainer) private var currentContainer
    
    let section: ConsoleSection
    
//    private let styleData: SectionStyleData
    
    init(section: ConsoleSection) {
        self.section = section
//        self.styleData = section.getViewStyleData(container: <#T##HandheldConsoleContainer#>)
        
    }
    
    var body: some View {
        Rectangle()
//            .fill(styleData.color)
//            .containerValue(\.rectSliceStartingPosition, styleData.sliceOriginPosition)
//            .containerValue(\.rectSliceProportion, styleData.sizeProportion)
//            .containerValue(\.sliceOrientation, ((styleData.sliceOriginPosition == .maxXEdge) || (styleData.sliceOriginPosition == .minXEdge)) ? .horizontal : .vertical )
//            .containerValue(\.sectionIdentifier, section.description)
    }
    
}


struct PreviewView: View {
    
    @State var console: HandheldConsoleContainer = .gameboyAdvance
    
    var body: some View {
        VStack {
            ConsoleView(console: $console)
            HStack {
                ForEach(HandheldConsoleContainer.allCases) { innerConsole in
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
}

#Preview {
    PreviewView()
}

