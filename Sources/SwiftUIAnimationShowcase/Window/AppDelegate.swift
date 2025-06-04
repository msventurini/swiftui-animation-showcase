//
//  AppDelegate.swift
//  SwiftUIAnimationShowcase
//
//  Created by Matheus Silveira Venturini on 21/05/25.
//

import Cocoa

public class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: MainWindow?

    public func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        mainWindow = MainWindow()
        mainWindow?.makeKeyAndOrderFront(nil)
        
    }

    public func applicationWillTerminate(_ aNotification: Notification) {
        
    }

    public func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
