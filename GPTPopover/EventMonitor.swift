//
//  EventMonitor.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import Cocoa

class EventMonitor {
    
    private var monitor: Any?
    
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping () -> Void) {
        self.mask = mask
        self.handler = { _ in handler() }
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler) as! NSObject
    }
    
    func stop() {
        guard let monitor = monitor else { return }
        
        NSEvent.removeMonitor(monitor)
        self.monitor = nil
    }
}
