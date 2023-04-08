//
//  AppDelegate.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusBarController: StatusBarController?
    private var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView(fullScreenHandler: { [weak self] in
            self?.popover.toggleSize()
        }, closeAutomaticallyHandler: { [weak self] toggleValue in
            self?.statusBarController?.changeEventMonitorActive(with: toggleValue)
        })

        popover.contentSize = NSPopover.defaultSize
        popover.contentViewController = NSHostingController(rootView: contentView)

        statusBarController = StatusBarController(popover)
    }
}
