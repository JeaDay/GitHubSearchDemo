//
//  AppDelegate.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 19/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navigationController = UINavigationController()
        let baseVC = BaseViewController()
        navigationController.viewControllers = [baseVC]
        navigationController.definesPresentationContext = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {}

}
