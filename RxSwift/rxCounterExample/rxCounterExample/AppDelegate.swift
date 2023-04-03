//
//  AppDelegate.swift
//  rxCounterExample
//
//  Created by Hyeon on 2022/06/04.
//

import SnapKit
import RxAppState
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            return true
        }
        
        // 13 이전의 경우에는 SceneDelegate에서 해주었던 작업을 그대로 진행해주면 된다.
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = .white
//        startView()
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = .white
//        window?.rootViewController = MainViewController(BaseViewModel())
//        window?.makeKeyAndVisible()
        return true
    }
    
    private func startView() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let mainViewController = MainViewController(MainViewModel())
        appDelegate.window?.rootViewController = mainViewController
        appDelegate.window?.makeKeyAndVisible()
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

