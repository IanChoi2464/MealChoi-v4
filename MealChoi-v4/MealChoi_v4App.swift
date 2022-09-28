//
//  MealChoi_v4App.swift
//  MealChoi-v4
//
//  Created by Choi Jihyock on 9/23/22.
//

import SwiftUI
import Firebase

@main
struct MealChoi_v4App:App{
    @UIApplicationDelegateAdaptor var delegate: MyAppDelegate
    init(){
        FirebaseApp.configure()
    }
    var body:some Scene{
        WindowGroup{
            RootView()
                .environmentObject(DiningModel())
                .environmentObject(EtcModel())
        }
    }
}

class MySceneDelegate:NSObject,UIWindowSceneDelegate{
    var window:UIWindow?
    func sceneDidEnterBackground(_ scene:UIScene){
        exit(0)
    }
}

class MyAppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application:UIApplication,configurationForConnecting connectingSceneSession:UISceneSession,options:UIScene.ConnectionOptions)->UISceneConfiguration{
            let sceneConfig=UISceneConfiguration(name:nil,sessionRole:connectingSceneSession.role)
            sceneConfig.delegateClass=MySceneDelegate.self
            return sceneConfig
    }
}
