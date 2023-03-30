//
//  AppDelegate.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusBar: StatusBarController?
    private var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView(fullScreenHandler: { [weak self] in
            self?.popover.toggleSize()
        })

        popover.contentSize = NSPopover.defaultSize
        popover.contentViewController = NSHostingController(rootView: contentView)

        statusBar = StatusBarController(popover)
    }
}
