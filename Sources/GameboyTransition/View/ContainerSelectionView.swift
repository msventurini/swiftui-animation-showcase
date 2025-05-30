//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftUIComponentKit

struct ContainerSelectionView: View {
    @Environment(ContainerCollection.self) private var containerCollection: ContainerCollection
    
    
    
    var body: some View {
        @Bindable var containerCollection = self.containerCollection
        VStack {
            
            Rectangle()
                .fill(.pink)
                .overlay {
                    ConsoleFrameLayout2(frameWidth: containerCollection.selected.width, frameHeight: containerCollection.selected.height) {
                        ForEach(containerCollection.selected.sections.sorted(by: { $0.drawingOrderNumber < $1.drawingOrderNumber })) { section in
                            
                            Rectangle()
                            //            .fill(consoleSection.animatableColor.asSwiftUIColor())
                                .strokeBorder()
                                .containerValue(\.frameWidth, section.width)
                                .containerValue(\.frameHeight, section.heigh)
                                .containerValue(\.frameWidth, section.originX)
                                .containerValue(\.frameHeight, section.originY)
                            
                            
                            
                            //                                .environment(section)
                            //                                .containerValue(\.consoleSectionData, section)
                            
                        }
                        
                    }
                }
            
            
            
            HStack {
                ForEach(containerCollection.containers) { container in
                    
                    Button {
                        withAnimation(.snappy) {
                            containerCollection.selected = container
                        }
                        
                    } label: {
                        Text(container.containerName)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

//@Observable class ConsoleLayoutSectionValues {
//    var sliceProportion
//    var sliceOriginPosition
//}

//struct ConsoleSectionsViewer<Content>


struct ConsoleSectionsViewer<Content>: View where Content: View {
    
    @Environment(ContainerCollection.self) private var containerCollection: ContainerCollection
    
    
    @ViewBuilder let content: (ConsoleSection) -> Content
    
    var body: some View {
        @Bindable var containerCollection = self.containerCollection
        
        ConsoleFrameLayout2(frameWidth: containerCollection.selected.width, frameHeight: containerCollection.selected.height) {
            
            ForEach(containerCollection.selected.sections) { consoleSection in
                
                content(consoleSection)
                
            }
        }
    }
}



struct ContainerSectionView: View, Animatable {
    
    @Environment(ConsoleSection.self) private var consoleSection: ConsoleSection
    
    //    var consoleSection: ConsoleSection
    
    var body: some View {
        
        //            .containerValue(\.sliceOrientation, consoleSection.sliceOrientation)
        //            .containerValue(\.rectSliceProportion, consoleSection.sizeProportion)
        //            .containerValue(\.rectSliceStartingPosition, consoleSection.sliceOriginPosition)
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}


struct ConsoleFrameLayout2: Layout {
    
    
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(frameWidth, frameHeight)
        }
        
        set {
            frameWidth = newValue.first
            frameHeight = newValue.second
            
        }
    }
    
    var frameWidth: Double
    var frameHeight: Double
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let width = frameWidth
        let height = frameHeight

        return .init(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        print(proposal)
        print(bounds)
        
        var currentSlice = bounds

        for (_, subview) in subviews.enumerated() {
            
            print(subview.containerValues.sectionIdentifier)
            let sliceOrigin: CGRectEdge = .minXEdge
            let sliceSizeProportion = 0.5
            let sliceOrientation: SliceOrientation = .horizontal
            print(sliceOrientation)
            
            let sliceSize = (sliceOrientation == .horizontal) ? bounds.width * sliceSizeProportion : bounds.height * sliceSizeProportion
            
            let (slice, remainder) = currentSlice.divided(atDistance: sliceSize, from: sliceOrigin)
            
            currentSlice = remainder
            
            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            
        }
        
        
        
    }
    
}
