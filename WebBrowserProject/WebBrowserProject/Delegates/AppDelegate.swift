//
//  AppDelegate.swift
//  WebBrowserProject
//
//  Created by 이영재 on 2021/08/17.
//

import UIKit

// 마지막 페이지 주소를 UserDefaults에서 관리하기 위한 키 값
let lastPageURLDefaultKey: String = "lastURL"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    var lastPageURL: URL?
    
    //MARK: - Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        lastPageURL = UserDefaults.standard.url(forKey: lastPageURLDefaultKey)
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

