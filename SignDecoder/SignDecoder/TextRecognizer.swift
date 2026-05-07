//
//  TextRecognizer.swift
//  SignDecoder
//
//  Created by 仲里絢音 on 2026/05/07.
//
// テキスト検索エンジンコード

import Foundation
import SwiftUI
import Vision


struct TextRecognizer {
    var recognizedText = "" //画像に含まれるすべてのテキストを格納する変数
    var observations: [RecognizedTextObservation] = []
    
    init(imageResource: ImageResource) async { //処理が重いから非同期処理にするよascync
        var request = RecognizeTextRequest() //文字認識のリクエスト
        // request.recognitionLevel = .fast //処理は速いが認識の精度は落ちる．動画や大量の画像用
        request.recognitionLevel = .accurate //精度いいやつ．処理は遅い


        let image = UIImage(resource: imageResource)


        if let imageData = image.pngData(),
           let results = try? await request.perform(on: imageData) { //try? → 失敗してもクラッシュしない・nilを返す await → 認識が終わるまで待つ！
            observations = results

        }
        
        for observation in observations {
            let candidate = observation.topCandidates(1) //最も可能性のあるものを入れて .topCandidates(1) → 1番可能性が高いものだけ！（）は1つだけって意味．この時点で[SLOW,DOEM]
            
            if let observedText = candidate.first?.string { //
                   recognizedText += "\(observedText) " //ここで「SLOW」+「DOWN」
                }
            }
    }
}
