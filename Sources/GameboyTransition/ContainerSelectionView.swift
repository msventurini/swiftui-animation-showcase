//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData

//struct ShowConsole()

struct OptionalConsoleSelection<Content: View, EmptyContent: View>: View {

    var selectedConsole: ConsoleModel?
    var content: (ConsoleModel) -> Content?
    var emptySelectionContent: EmptyContent

    var additionalView: (() -> AnyView)?
    
    
    @ViewBuilder var teste: some View {
        if let selectedConsole {
            content(selectedConsole)
        } else {
            emptySelectionContent
        }
    }
    
    init(_ selectedConsole: ConsoleModel?, @ViewBuilder content: @escaping (ConsoleModel) -> Content, @ViewBuilder onEmptySelection emptySelectionContent: () -> EmptyContent) {
        self.selectedConsole = selectedConsole
        self.content = content
        self.emptySelectionContent = emptySelectionContent()
    }

    var body: some View {
        
        teste
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct ContainerSelectionView: View {
    @Environment(\.modelContext) var modelContext

    @Query(sort: \ConsoleModel.containerName)
    private var consoles: [ConsoleModel]
    
    @State private var selectedConsole: ConsoleModel? = nil
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                OptionalConsoleSelection(selectedConsole) { model in
                    
                    ContainerView(console: model)
                    
                } onEmptySelection: {
                    
                    ContentUnavailableView {
                        Label("Select Anything", systemImage: "gamecontroller.circle")
                    } description: {
                        Text("You'll be amazed by the animations!")
                    }
                    
                }
                
                Picker("Console Selection", selection: $selectedConsole) {
                    Text("none").tag(nil as ConsoleModel?)
                    ForEach(consoles) { console in
                        Text(console.containerName)
                            .tag(console)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            
        }
//        .task {
//            selectedConsole = consoles.first
//        }
        
        
        
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}
//
//struct ContentView: View {
//    @State private var selectedTheme = "Dark"
//    let themes = ["Dark", "Light", "Automatic"]
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Picker("Appearance", selection: $selectedTheme) {
//                    ForEach(themes, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .pickerStyle(.segmented)
//
//                Toggle("Bold Text", isOn: .constant(true))
//            }
//            .navigationTitle("Display & Brightness")
//        }
//    }
//}
