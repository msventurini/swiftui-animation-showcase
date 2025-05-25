//
//  Consolebody.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation


public struct Consolebody: View, @preconcurrency Animatable {
    
    var redComponent: CGFloat
    var greenComponent: CGFloat
    var blueComponent: CGFloat
    var opacityComponent: CGFloat
    
    var bodyOriginX: CGFloat
    var bodyOriginY: CGFloat
//    var bodyWidth: CGFloat
//    var bodyHeight: CGFloat
    var bodySize: AnimatableSize
    
    var rotationAngle: CGFloat
    var color: BodyColor
    
    public init(redComponent: CGFloat, greenComponent: CGFloat, blueComponent: CGFloat, opacityComponent: CGFloat, bodyOriginX: CGFloat, bodyOriginY: CGFloat, bodySize: AnimatableSize, rotationAngle: CGFloat, console: Gameboy, color: BodyColor) {
        self.redComponent = redComponent
        self.greenComponent = greenComponent
        self.blueComponent = blueComponent
        self.opacityComponent = opacityComponent
        self.bodyOriginX = bodyOriginX
        self.bodyOriginY = bodyOriginY
        self.bodySize = bodySize
        self.rotationAngle = rotationAngle
        self.console = console
        self.color = color
    }
    
    public var animatableData:
    
    AnimatablePair<
        AnimatablePair<CGFloat, BodyColor.AnimatableData>
    , AnimatablePair< //Referente ao tamanho do corpo
        AnimatablePair<CGFloat, CGFloat>,
        AnimatableSize
    >
    
    > {
        get {
            AnimatablePair(
                
                AnimatablePair(rotationAngle, color.animatableData),
                AnimatablePair(
                    AnimatablePair(bodyOriginX, bodyOriginY),
                    bodySize,
                )
            )
            
        }
        set {
            
            
            rotationAngle = newValue.first.first
            color.animatableData = newValue.first.second
            
            bodyOriginX = newValue.second.first.first
            bodyOriginY = newValue.second.first.second
            bodySize = newValue.second.second
            
            redComponent = color.redComponent
            greenComponent = color.greenComponent
            blueComponent = color.blueComponent
            opacityComponent = color.opacityComponent
        }
    }
    
    let console: Gameboy
    
    public var body: some View {
        Canvas(
            opaque: true,
            colorMode: .linear,
            rendersAsynchronously: false
        ) { context, size in
            
            
            let midpoint = CGPoint(
                x: size.width * 0.5,
                y: size.height * 0.5
            )
            
            
            let frameRect = CGRect(
                origin: .zero,
                size: size
            )
            
            
            let framePath = Rectangle().path(in: frameRect)
            context.fill(framePath, with:
                    .color(
                        red: 1.0 - redComponent,
                        green: 1.0 - greenComponent,
                        blue: 1.0 - blueComponent,
                        opacity: 1.0)
            )
            
            context.drawLayer { layerContext in
                
                let rect = CGRect(
                    origin: CGPoint(x: bodyOriginX, y: bodyOriginY),
                    size: CGSize(width: bodySize.width, height: bodySize.height)
                )
                
                
                var transform: CGAffineTransform = CGAffineTransformMakeTranslation(midpoint.x, midpoint.y);
                transform = CGAffineTransformRotate(transform, rotationAngle);
                transform = CGAffineTransformTranslate(transform, -midpoint.x, -midpoint.y);
                
                layerContext.transform = transform
                
                
                let path = Rectangle().path(in: rect)
                layerContext.fill(path, with: .color(red: color.redComponent, green: color.greenComponent, blue: color.blueComponent, opacity: color.opacityComponent))
                
                
            }
            
            
        }
    }
}

#Preview {
    GameboyTransitionView()
    
    
    //    ConsoleBody()
}



