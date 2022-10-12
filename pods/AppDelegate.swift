//
//  AppDelegate.swift
//  pods
//
//  Created by Uros Andonov on 10.10.22..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return false }
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }


}

