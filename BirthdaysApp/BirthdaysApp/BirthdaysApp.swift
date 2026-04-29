//
//  BirthdaysAppApp.swift
//  BirthdaysApp
//
//  Created by 仲里絢音 on 2026/04/29.
//

import SwiftUI
import SwiftData //SwiftDataとSwiftDataを接続

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
