//
//  TrailTheme.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//
import Foundation
import SwiftUI


struct TrailTheme: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxHeight: 250, alignment: .top)
                Spacer()
                        }
            content
        }
    }
}


extension View {
    func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}
