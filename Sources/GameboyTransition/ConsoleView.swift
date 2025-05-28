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
                    
//                    let styleData = section.getStyleData(container: console)
                    let styleData = section.getStyleData(container: console)
                    
                    Rectangle()
                        .fill(styleData.color)
//                        .containerValue(\.sizeProportion, styleData.sizeProportion)
//                        .containerValue(\.originPosition, styleData.originPosition)
//                        .onAppear {
//                            print(section.id)
//                        }
                }
            }
            .background(.red)
            .aspectRatio(90/148, contentMode: .fit)
    }
}

#Preview {
    @Previewable @State var console: HandheldConsoleContainer = .gameboyDMG
    @Previewable @State var widthSize: Double = 100
    
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

