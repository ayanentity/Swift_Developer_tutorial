//
//  BoundsRect.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//
import Foundation
import SwiftUI
import Vision


struct BoundsRect: Shape {
    let normalizedRect: NormalizedRect


    func path(in rect: CGRect) -> Path { //認識されたテキストの各観測値には、画像内のどこでテキストが認識されたかに関する情報が含まれている
        let imageCoordinatesRect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(imageCoordinatesRect)
    }
}
