
//  AppDelegate.swift
//  GoodWeather
//
//  Created by Hyeon on 2022/01/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let myColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = myColor
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        barAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        

            let navigationBar = UINavigationBar.appearance()
            navigationBar.standardAppearance = barAppearance
            navigationBar.scrollEdgeAppearance = barAppearance
        
        UIBarButtonItem.appearance().tintColor =  UIColor.white
        
        return true
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

