//
//  AppDelegate.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = HomeViewController()
        let navi = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }

}

