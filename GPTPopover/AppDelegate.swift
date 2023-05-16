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
        }, onDragHandler: { [weak self] in
            let currentLocation = NSEvent.mouseLocation
            var newOrigin = currentLocation
            let screenFrame = NSScreen.main!.frame
            
            newOrigin.x = screenFrame.size.width - currentLocation.x
            newOrigin.y = screenFrame.size.height - currentLocation.y
            
            if newOrigin.x < NSPopover.defaultSize.width {
                newOrigin.x = NSPopover.defaultSize.width
            }

            if newOrigin.y < 650 {
                newOrigin.y = 650
            }
            
            let newSize = NSSize(width: newOrigin.x, height: newOrigin.y)
            
            self?.popover.contentSize = newSize
            NSPopover.currentSize = newSize
        })

        popover.contentSize = NSPopover.defaultSize
        popover.contentViewController = NSHostingController(rootView: contentView)

        statusBarController = StatusBarController(popover)
    }
}
