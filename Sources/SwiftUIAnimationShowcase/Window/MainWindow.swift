//
//  MainWindow.swift
//  SwiftUIAnimationShowcase
//
//  Created by Matheus Silveira Venturini on 21/05/25.
//

import Cocoa
import SwiftUI

class MainWindow: NSWindow {
    init() {
        super.init(
            contentRect: NSRect(x: 0, y: 0, width: 640, height: 480),
            styleMask: [
                .titled,
                .closable,
                .miniaturizable,
                .resizable,
                .fullSizeContentView,
            ],
            backing: .buffered,
            defer: false
        )
        
        titlebarAppearsTransparent = true
        
        let screenSize = CGSize(width: 640, height: 480)
        
        if let screenFrame = NSScreen.main?.frame {
            setFrame(
                NSRect(
                    origin: CGPoint(
                        x: screenFrame.midX - (screenSize.width * 0.5),
                        y: screenFrame.midY - (screenSize.height * 0.5)
                    ),
                    size: NSSize(width: 640, height: 480)
                ),
                display: true
            )
        }
        let hostingController = NSHostingController(rootView: Rectangle().overlay(content: {
            ContentView()
        }))
        let vc = hostingController
        contentView = vc.view
        contentViewController = vc
    }
}

