//
//  StatusBarController.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import AppKit

class StatusBarController {
    
    private let statusBar: NSStatusBar
    private let statusItem: NSStatusItem
    private let popover: NSPopover
    
    private lazy var eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown], handler: mouseEventHandler)
    
    init(_ popover: NSPopover) {
        self.popover = popover
        
        statusBar = .system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = NSImage(systemSymbolName: "message.and.waveform.fill", accessibilityDescription: nil)
            statusBarButton.image?.isTemplate = true
            statusBarButton.action = #selector(togglePopover)
            statusBarButton.target = self
        }
        
        eventMonitor.start()
    }
    
    @objc private func togglePopover() {
        if popover.isShown {
            hidePopover()
        } else {
            showPopover()
        }
    }
    
    private func showPopover() {
        guard let statusBarButton = statusItem.button else { return }
        
        popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: .maxY)
    }
    
    private func hidePopover() {
        popover.performClose(nil)
    }
    
    private func mouseEventHandler() {
        guard popover.isShown else { return }
        
        hidePopover()
    }
    
    func changeEventMonitorActive(with value: Bool) {
        if value {
            eventMonitor.start()
        } else {
            eventMonitor.stop()
        }
    }
}

