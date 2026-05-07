//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//
import SwiftUI
import Vision

struct TextRecognitionView: View {
    let imageResource: ImageResource //imageResourceで参照できる？
    @State private var textRecognizer: TextRecognizer? //nilかどうか
    let boundingColor = Color(red: 1.00, green: 0.00, blue: 0.85) //色の指定


    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit) //figmaのfitと同じ
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
                .overlay {
                    if let observations = textRecognizer?.observations {
                        ForEach(observations, id: \.uuid) { observation in
                               BoundsRect(normalizedRect: observation.boundingBox)
                                   .stroke(boundingColor, lineWidth: 3)
                           }

                    }
                }
            Spacer()
                
            TranslationView(text: textRecognizer?.recognizedText ?? "", isProcessing: isProcessing)
        }
        .padding()
        .trailTheme()
        .navigationTitle("Sign Info")
    }
    private var isProcessing: Bool {
            textRecognizer == nil
        }
}


#Preview {
    NavigationStack{
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
}
