//
//  ContentView.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack( alignment: .leading, spacing: 50){
                Text("Tap to select a sign to translate")
                    .font(.headline)
                
                ImageGalleryView()
                Spacer()
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
            
        }
    }
}

#Preview {
    ContentView()
}
