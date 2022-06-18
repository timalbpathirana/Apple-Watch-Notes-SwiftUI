//
//  WatchAppApp.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 18/6/2022.
//

import SwiftUI

@main
struct WatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
