//
//  OkezoneNewsApp.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import SwiftUI

@main
struct OkezoneNewsApp: App {
    @StateObject var newsBookmark = Bookmark()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(newsBookmark)
        }
    }
}
