//
//  ConsoleView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI

struct ConsoleView: View {
    
    var console: HandheldConsoleContainer

    var body: some View {
            SectionsGrid {
                ForEach(console.sections) { section in

                    let styleData = section.getStyleData(container: console)
                    
                    Rectangle()
                        .fill(styleData.color)
                        .containerValue(\.rectSliceStartingPosition, styleData.sliceOriginPosition)
                        .containerValue(\.rectSliceProportion, styleData.sizeProportion)
                    
                }
            }
            .background(.red)
            .aspectRatio(90/148, contentMode: .fit)
    }
}

struct PreviewView: View {
    
    @State var console: HandheldConsoleContainer = .gameboyDMG
    @State var widthSize: Double = 100
    
    var body: some View {
        VStack {
            ConsoleView(console: console)
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

