//
//  ContentView.swift
//  GPTPopover
//
//  Created by Alessandro Loi on 30/03/23.
//

import SwiftUI
import ServiceManagement

struct ContentView: View {
    
    private let url = URL(string: "https://chat.openai.com/chat")!
    
    @State private var isFullscreen = false
    @State private var willCloseAutomatically = true
    
    let fullScreenHandler: () -> Void
    let closeAutomaticallyHandler: (Bool) -> Void
    
    var body: some View {
        Spacer()
        
        VStack {
             
            HStack {
                
                Toggle(isOn: $willCloseAutomatically, label: {
                    Text("Close Automatically")
                })
                
                Spacer()
                
                Button(action: {
                    isFullscreen.toggle()
                    fullScreenHandler()
                }) {
                    Image(systemName: isFullscreen ? "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left" : "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right")
                        .imageScale(.large)
                }
                .buttonStyle(BorderlessButtonStyle())

                Button(action: {
                    NSApp.terminate(self)
                }) {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                }
                .buttonStyle(BorderlessButtonStyle())

            }.padding(.horizontal, 15)
            
            WebView(url: url)
        }.onChange(of: willCloseAutomatically) { toggleValue in
            closeAutomaticallyHandler(toggleValue)
        }
    }
}
