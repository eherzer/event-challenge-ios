//
//  AppDelegate.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 15/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = EventListVC()
        
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}
