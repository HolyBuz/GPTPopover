//
//  AppDelegate.swift
//  AutoLauncher
//
//  Created by Alessandro Loi on 30/03/23.
//

import Cocoa

class AutoLauncherAppDelegate: NSObject, NSApplicationDelegate {

    struct Constants {
        static let mainAppBunbdleID = "AlessandroLoi.GPTPopover"
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = runningApps.contains {
            $0.bundleIdentifier == Constants.mainAppBunbdleID
        }
        
        if !isRunning {
            var path = Bundle.main.bundlePath as NSString
            for _ in 1...4 {
                path = path.deletingLastPathComponent as NSString
            }
            let applicationPathString = path as String
            NSWorkspace.shared.launchApplication(applicationPathString)
        }
    }
}

