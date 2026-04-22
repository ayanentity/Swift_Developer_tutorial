//
//  ContentView.swift
//  MicroAdventures
//
//  Created by 仲里絢音 on 2026/04/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            MapScreen()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            // ② ダミータブ（練習用）
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
        }
    }
}

#Preview {
    ContentView()
}
