//
//  Untitled.swift
//  ImageGenerator
//
//  Created by 仲里絢音 on 2026/05/11.
//

import SwiftUI
import ImagePlayground


@Observable
class AppManager {
    let imageGenerator = ImageGenerator()
    var currentImage: NSImage?


    private(set) var error: Error?
    private(set) var isGenerating = false


    func generateImage() {
        error = nil
        isGenerating = true


        Task {
            do {
                let generatedImage = try await imageGenerator.generate()
                currentImage = NSImage(cgImage: generatedImage.cgImage, size: .zero)
                isGenerating = false
            } catch {
                self.error = error
                isGenerating = false
            }
        }
    }
}


extension View {
    func previewEnvironment() -> some View {
        let appManager = AppManager()
        return environment(appManager)
    }
}
