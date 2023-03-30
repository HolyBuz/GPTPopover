//
//  NSPopover+.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import AppKit

extension NSPopover {
    
    static let defaultSize = NSSize(width: 800, height: 500)
    
    func toggleSize() {
        if contentSize == NSPopover.defaultSize, let screen = NSScreen.main {
            let rect = screen.frame
            let height = rect.size.height
            let width = rect.size.width
            contentSize = NSSize(width: width, height: height)
        } else {
            contentSize = NSPopover.defaultSize
        }
    }
}
