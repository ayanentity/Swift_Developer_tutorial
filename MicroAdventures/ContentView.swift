//
//  ContentView.swift
//  MicroAdventures
//
//  Created by 仲里絢音 on 2026/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            Tab("Map", systemImage: "map.fill"){
                MapScreen()
            }
            // バッジの数値をカレンダー情報にしてみた
            .badge(Calendar.current.component(.hour, from: Date()))
            
            Tab("ExploerView",systemImage: "globe"){
                ExploreView()
            }
            .badge(Calendar.current.component(.day, from: Date()))
        }
    }
}

#Preview {
    ContentView()
}
