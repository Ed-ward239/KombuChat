//
//  BC_ConnectApp.swift
//  Shared
//
//  Created by Edward Lee on 18/3/22.
//

import SwiftUI
import Firebase

@main
struct KombuChat: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
