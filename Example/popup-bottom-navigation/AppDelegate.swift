//
//  AppDelegate.swift
//  popup-bottom-navigation
//
//  Created by 5010169 on 05/30/2023.
//  Copyright (c) 2023 5010169. All rights reserved.
//

import UIKit
import popup_bottom_navigation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow()
        let tabBarController = PopupTabBarController()
        
        tabBarController.viewControllers = [
            ViewController().navigation(
                title: "First",
                image: UIImage(systemName: "candybarphone")!,
                tag: 0
            ),
            PopupTabController()
                .nested(
                    viewControllers: [
                        ViewController().navigation(
                            title: "Отзывы",
                            image: UIImage(systemName: "checkmark.message")!,
                            tag: 1
                        ),
                        ViewController().navigation(
                            title: "Лента",
                            image: UIImage(systemName: "text.bubble")!,
                            tag: 2
                        )
                    ]
                )
                .navigation(
                    title: "Nested",
                    image: UIImage(systemName: "candybarphone")!,
                    tag: 2
                ),
            ViewController().navigation(
                title: "Third",
                image: UIImage(systemName: "candybarphone")!,
                tag: 3
            ),
            ViewController().navigation(
                title: "Four",
                image: UIImage(systemName: "candybarphone")!,
                tag: 4
            ),
            ViewController().navigation(
                title: "Five",
                image: UIImage(systemName: "candybarphone")!,
                tag: 5
            )
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension UIViewController {
    func navigation(title: String, image: UIImage, tag: Int) -> Self {
        self.navigationItem.title = title
        self.tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: tag
        )
        return self
    }
}

extension PopupTabController {
    func nested(viewControllers: [UIViewController]) -> Self {
        self.nestedViewControllers = viewControllers
        return self
    }
}
