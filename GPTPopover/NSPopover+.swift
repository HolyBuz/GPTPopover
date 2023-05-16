//
//  NSPopover+.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import AppKit

extension NSPopover {
    
    static var currentSize = NSPopover.defaultSize
    static var defaultSize = NSSize(width: NSScreen.main!.frame.maxX/2,
                                    height: NSScreen.main!.frame.maxY - 200)
    
    func toggleSize() {
        if contentSize <= NSPopover.defaultSize, let screen = NSScreen.main {
            let rect = screen.frame
            let height = rect.size.height
            let width = rect.size.width
            contentSize = NSSize(width: width, height: height)
        } else {
            contentSize = NSPopover.defaultSize
        }
    }
}

extension NSSize: Comparable {
    public static func < (lhs: CGSize, rhs: CGSize) -> Bool {
        lhs.width < rhs.width || lhs.height < rhs.height
    }
}
