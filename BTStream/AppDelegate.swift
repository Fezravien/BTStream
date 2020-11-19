//
//  AppDelegate.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit
import GoogleSignIn
import Firebase
//import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate// GIDSignInDelegate
{
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
////
//    }
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return true
//        //GIDSignIn.sharedInstance().handle(url)
//
//}




    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        FirebaseApp.configure()
//        // OAuth 2.0 클라이언트 ID
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = "484752046-5k948t1g8u9gpun1r2bvqokg7grcn9g2.apps.googleusercontent.com"
        //        GIDSignIn.sharedInstance().delegate = self

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

