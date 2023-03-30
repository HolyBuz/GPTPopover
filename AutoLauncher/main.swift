//
//  main.swift
//  AutoLauncher
//
//  Created by Alessandro Loi on 30/03/23.
//

import Cocoa

let delegate = AutoLauncherAppDelegate()
NSApplication.shared.delegate = delegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
