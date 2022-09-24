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
