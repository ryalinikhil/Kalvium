//
//  KalviumApp.swift
//  Kalvium
//
//  Created by Sameer Nikhil on 11/11/24.
//


import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct KalviumApp: App {
    // Register AppDelegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RoleSelectionView()
            }
        }
    }
}
