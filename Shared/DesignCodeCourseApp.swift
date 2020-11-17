//
//  DesignCodeCourseApp.swift
//  Shared
//
//  Created by RadiBarq on 11/16/20.
//

import SwiftUI

@main
struct DesignCodeCourseApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
