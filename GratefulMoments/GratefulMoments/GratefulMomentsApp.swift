//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by 仲里絢音 on 2026/05/03.
//

import SwiftUI
import SwiftData


@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer) //倉庫の管理人を渡す
        }
        .modelContainer(dataContainer.modelContainer) //倉庫を渡す @Query や context で使う
    }
}
