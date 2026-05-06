//
//  TranslationView.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//

import SwiftUI
import Translation //翻訳機械学習フレームワーク
import Vision


struct TranslationView: View {
    var text: String
    var isProcessing: Bool
    @State private var showingTranslation = false


    var body: some View {
        VStack {
            Text("Identified Text")
                .font(.subheadline.bold())
                .textCase(.uppercase)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)


            Text(text)
                .frame(maxWidth: .infinity,
                       maxHeight: 50,
                       alignment: .topLeading)
                .padding()
                .background(Color(white: 0.9))
                .translationPresentation(isPresented: $showingTranslation, text: text)


            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
                    .frame(height: 50)
                    .frame(width: 200)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 24))
            }
            .disabled(text.isEmpty) //認識できない場合は選択不可
            .padding(.top)
        }
    }
}


#Preview {
    TranslationView(text: "Caution, falling rocks", isProcessing: false)
}
