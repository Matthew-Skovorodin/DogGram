//
//  DogGramApp.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/9/24.
//

import SwiftUI

@main
struct DogGramApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
