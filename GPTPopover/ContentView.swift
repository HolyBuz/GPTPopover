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
    
    @State private var isToggled = false
    
    var fullScreenHandler: () -> Void
    
    var body: some View {
        Spacer()
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    isToggled.toggle()
                    fullScreenHandler()
                }) {
                    Image(systemName: isToggled ? "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left" : "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right")
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
        }.onAppear {
            print("ALE: ", SMLoginItemSetEnabled("AlessandroLoi.AutoLauncher" as CFString, true))
        }
    }
}
