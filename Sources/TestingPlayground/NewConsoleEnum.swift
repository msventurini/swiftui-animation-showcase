//
//  NewConsoleEnum.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI

struct HandheldConsoleGeometry {
    
    let screenViewGeometry: ScreenViewGeometry
    let controlsGeometry: ControlsGeometry
    
    init(
        screenViewGeometry: ScreenViewGeometry,
        controlsGeometry: ControlsGeometry
    ) {
        self.screenViewGeometry = screenViewGeometry
        self.controlsGeometry = controlsGeometry
    }
    
    static let gameboyDMGGeometry = HandheldConsoleGeometry(
        screenViewGeometry: .gameboyDMGScreenViewGeometry,
        controlsGeometry: .gameboyDMGControlsGeometry
    )
        
}

struct ControlsGeometry {
    
    
    let sideSize: CGSize
    
    private init(sideSize: CGSize) {
        self.sideSize = sideSize
    }
    
    static let gameboyDMGControlsGeometry = ControlsGeometry(sideSize: .init(width: 220, height: 336))

    
}


struct ScreenViewGeometry {
    
    var displayScreenSize: CGSize
    var displayBezelSize: CGSize
    var displayBezelBorderRadius: RectangleCornerRadii
    var displayViewSize: CGSize
    
        
    private init(displayScreenSize: CGSize, displayBezelSize: CGSize, displayViewSize: CGSize, displayBezelBorderRadius: RectangleCornerRadii) {
        self.displayScreenSize = displayScreenSize
        self.displayBezelSize = displayBezelSize
        self.displayViewSize = displayViewSize
        self.displayBezelBorderRadius = displayBezelBorderRadius
    }
    
    static let gameboyDMGScreenViewGeometry: ScreenViewGeometry = .init(
        displayScreenSize: .init(width: 240, height: 216),
        displayBezelSize: .init(width: 368, height: 280),
        displayViewSize: .init(
            width: 440,
            height: 320
        ),
        displayBezelBorderRadius: .init(topLeading: 16, bottomLeading: 16, bottomTrailing: 72, topTrailing: 16)
    )
    
}

//448/ altura

enum NewConsoleEnum {
    
    case gameboyDmg
    
    var displayBezelColor: Color {
        switch self {
        case .gameboyDmg:
            return Color(.displayP3, red: 96.0/255.0, green: 106.0/255.0, blue: 120.0/255.0)
        }
    }

    var topDetailSize: CGSize {
        switch self {
        case .gameboyDmg:
            return .init(width: 440, height: 40)
        }
    }
    
    var viewGeometry: HandheldConsoleGeometry {
        switch self {
        case .gameboyDmg:
            return .gameboyDMGGeometry
        }
    }

    
}


struct TestingView: View {
    
    let console: NewConsoleEnum
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                
            }
            .frame(width: console.topDetailSize.width, height: console.topDetailSize.height)
            
            ZStack {

                ScreenBezelView(screenBezelData: ScreenBezel.gameboy)
                Rectangle()
                    .frame(width: console.viewGeometry.screenViewGeometry.displayViewSize.width, height: console.viewGeometry.screenViewGeometry.displayViewSize.height)

                

                
                Rectangle()
                    .frame(width: console.viewGeometry.screenViewGeometry.displayScreenSize.width, height: console.viewGeometry.screenViewGeometry.displayScreenSize.height)

            }
            HStack(spacing: 0) {
                Rectangle()
                    .frame(width: console.viewGeometry.controlsGeometry.sideSize.width, height: console.viewGeometry.controlsGeometry.sideSize.height)
                Rectangle()

                    .frame(width: console.viewGeometry.controlsGeometry.sideSize.width, height: console.viewGeometry.controlsGeometry.sideSize.height)
                
            }
        }
        
        
        
    }
}


#Preview {
    TestingView(console: .gameboyDmg)
//    GameboyBezelViewMask()
        .frame(width: 600, height: 800)
}

struct ScreenBezelView: View {
    
    var screenBezelData: ScreenBezel
    
    private var bezelSize: CGSize
    private var bezelBorderRadii: RectangleCornerRadii
    private var bezelColor: Color
    
    init(screenBezelData: ScreenBezel) {
        self.screenBezelData = screenBezelData
        self.bezelSize = screenBezelData.screenBezelSize
        self.bezelBorderRadii = screenBezelData.screenBezelBorderRadius
        self.bezelColor = screenBezelData.screenBezelColor
    }
    
    var body: some View {
        
        UnevenRoundedRectangle(
            cornerRadii: bezelBorderRadii,
            style: .circular
        )
        .fill(bezelColor)
        
        .frame(
            width: bezelSize.width,
            height: bezelSize.height
        )
    }
}

struct ScreenBezel {
    
    
    var screenBezelSize: CGSize
    var screenBezelBorderRadius: RectangleCornerRadii
    var screenBezelColor: Color
    
    
    private init(screenBezelSize: CGSize, screenBezelBorderRadius: RectangleCornerRadii, screenBezelColor: Color, mask: any Shape) {
        self.screenBezelSize = screenBezelSize
        self.screenBezelBorderRadius = screenBezelBorderRadius
        self.screenBezelColor = screenBezelColor
        
    }
    
    static let gameboy = ScreenBezel(
        screenBezelSize: .init(width: 368, height: 280),
        screenBezelBorderRadius: .init(topLeading: 16, bottomLeading: 16, bottomTrailing: 72, topTrailing: 16),
        screenBezelColor: Color(.displayP3, red: 96.0/255.0, green: 106.0/255.0, blue: 120.0/255.0),
        mask: GameboyBezelViewMask()
        
    )
    
    @ViewBuilder func getMask() -> some View {
        
    }
    
}

struct GameboyBezelViewMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerRadii: ScreenBezel.gameboy.screenBezelBorderRadius)
        return path
    }
}

//var screenBezelSize: CGSize
//var screenBezelBorderRadius: RectangleCornerRadii
//var screenBezelColor = Color(.displayP3, red: 96.0/255.0, green: 106.0/255.0, blue: 120.0/255.0)
