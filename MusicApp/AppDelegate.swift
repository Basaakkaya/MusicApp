//
//  AppDelegate.swift
//  MusicApp
//
//  Created by Başak Kaya on 2.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootController = UINavigationController(rootViewController: ViewController())
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.black
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
    

        return true
    }


}

