//
//  AppDelegate.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import UIKit//Library

@available(iOS 13.0, *)//Compatability information.
@UIApplicationMain//Main program...
class AppDelegate: UIResponder, UIApplicationDelegate {//Define app class.



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true//Defines test-launch function - starts with any key, returns TRUE
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

