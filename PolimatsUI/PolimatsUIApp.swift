//
//  PolimatsUIApp.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI
import AppTrackingTransparency
import OneSignalFramework
import GoogleMobileAds

@main
struct PolimatsUIApp: App {
    
    @StateObject var mainVM = MainPageViewModel()
    @StateObject var AdVM = ViewModelAd()
    @AppStorage("appearanceMode") var appearanceMode: AppearanceMode = .light
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    

    var body: some Scene {
        WindowGroup {
            
            TabbedView()
                .environmentObject(mainVM)
                .environmentObject(AdVM)
                .preferredColorScheme(appearanceMode == .dark ? .dark : .light)
            
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                        GADMobileAds.sharedInstance().start(completionHandler: nil)
                        
                        switch status {
                            
                        case .authorized:
                            print("authorized")
                        case .denied:
                            print("denied")
                        case .notDetermined:
                            print("notDetermined")
                        case .restricted:
                            print("restricted")
                        @unknown default:
                            print("unkown")
                        }
                    })
                }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate, OSNotificationPermissionObserver {
    
    @AppStorage("silencetMode") var silenceMode: silenceMode = .loud
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Remove this method to stop OneSignal Debugging
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        
        // OneSignal initialization
        OneSignal.initialize("22f4ef60-a8a4-4c08-8a3e-14f9ed5927c6", withLaunchOptions: launchOptions)
        OneSignal.Location.isShared = false
        OneSignal.setConsentRequired(true)
        OneSignal.setConsentGiven(true)
        OneSignal.Notifications.addPermissionObserver(self as OSNotificationPermissionObserver)
        // requestPermission will show the native iOS notification permission prompt.
        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
        
        // Login your customer with externalId
        // OneSignal.login("EXTERNAL_ID")
        
        return true
    }
    
    func onNotificationPermissionDidChange(_ permission: Bool) {
        silenceMode = permission ? .loud : .silence
    }
}
