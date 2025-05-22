//
//  AppDelegate.swift
//  SwiftUIAnimationShowcase
//
//  Created by Matheus Silveira Venturini on 21/05/25.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: MainWindow?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        mainWindow = MainWindow()
        mainWindow?.makeKeyAndOrderFront(nil)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
