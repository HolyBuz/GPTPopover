//
//  ResizableWKWebView.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 07/04/23.
//

import WebKit

class ResizableWKWebView: WKWebView {
    
    private var shouldAllowDrag = false {
        didSet(newValue) {
            if newValue {
                NSCursor.openHand.set()
            } else {
                NSCursor.arrow.set()
            }
        }
    }
    
    private let onDragHandler: () -> Void
    
    private var isDragging = false
    
    init(onDragHandler: @escaping () -> Void) {
        self.onDragHandler = onDragHandler
        
        super.init(frame: .zero, configuration: WKWebViewConfiguration())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDragged(with event: NSEvent) {
        super.mouseDragged(with: event)
        
        guard shouldAllowDrag else { return }
        onDragHandler()
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        guard shouldAllowDrag else { return }
        isDragging = true
        NSCursor.closedHand.set()
    }
    
    override func mouseUp(with event: NSEvent) {
        super.mouseUp(with: event)
        isDragging = false
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()

        for trackingArea in trackingAreas {
            removeTrackingArea(trackingArea)
        }
        
        let options: NSTrackingArea.Options = [.mouseEnteredAndExited, .activeAlways, .mouseMoved]
        let trackingArea = NSTrackingArea(rect: bounds, options: options, owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    
    override func mouseMoved(with event: NSEvent) {
        let currentLocation = NSEvent.mouseLocation
        var cursorPosition = currentLocation
        let screenFrame = NSScreen.main!.frame
        
        cursorPosition.x = screenFrame.size.width - currentLocation.x
        cursorPosition.y = screenFrame.size.height - currentLocation.y
        
        let range = bounds.maxY + 50...bounds.maxY + 100
        shouldAllowDrag = range.contains(cursorPosition.y)
    }
    
    override func mouseExited(with event: NSEvent) {
        guard !isDragging else { return }
        NSCursor.arrow.set()
    }
}
