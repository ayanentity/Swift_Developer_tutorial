//
//  ContentsVeiw.swift
//  OnbardingFlow
//
//  Created by 仲里絢音 on 2026/04/25.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]
let accentColor: [Color] = [.accentColor]


struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}


#Preview {
    ContentView()
}
